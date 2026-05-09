; DESCRIPTION: Composite: Places a white 109x26 rectangle at position (382, 212) then Draws a red line from (272, 18) to (138, 100).
; PLAN: r0=382(x), r1=212(y), r2=109(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x1), r6=18(y1), r7=138(x2), r8=100(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 212
LDI r2, 109
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 18
LDI r7, 138
LDI r8, 100
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
