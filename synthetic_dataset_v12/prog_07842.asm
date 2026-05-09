; DESCRIPTION: Composite: Places a blue 52x79 rectangle at position (245, 106) then Draws a black line from (162, 2) to (473, 213).
; PLAN: r0=245(x), r1=106(y), r2=52(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x1), r6=2(y1), r7=473(x2), r8=213(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 245
LDI r1, 106
LDI r2, 52
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 2
LDI r7, 473
LDI r8, 213
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
