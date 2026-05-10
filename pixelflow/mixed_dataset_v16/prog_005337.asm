; DESCRIPTION: Composite: Places a yellow 26x19 rectangle at position (247, 36) then Draws a red line from (290, 14) to (234, 44).
; PLAN: r0=247(x), r1=36(y), r2=26(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x1), r6=14(y1), r7=234(x2), r8=44(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 36
LDI r2, 26
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 14
LDI r7, 234
LDI r8, 44
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
