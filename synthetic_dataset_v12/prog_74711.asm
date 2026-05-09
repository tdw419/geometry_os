; DESCRIPTION: Composite: Renders a red line between points (409, 97) and (39, 88) then Renders a yellow box of size 20x77 starting at (150, 26).
; PLAN: r0=409(x1), r1=97(y1), r2=39(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=26(y), r7=20(width), r8=77(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 97
LDI r2, 39
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 26
LDI r7, 20
LDI r8, 77
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
