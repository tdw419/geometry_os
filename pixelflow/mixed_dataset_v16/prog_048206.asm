; DESCRIPTION: Composite: Places a green 87x43 rectangle at position (187, 118) then Draws a red line from (262, 209) to (336, 54).
; PLAN: r0=187(x), r1=118(y), r2=87(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x1), r6=209(y1), r7=336(x2), r8=54(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 187
LDI r1, 118
LDI r2, 87
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 209
LDI r7, 336
LDI r8, 54
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
