; DESCRIPTION: Composite: Places a green line segment connecting (333, 243) to (81, 201) then Renders a red box of size 21x118 starting at (180, 65).
; PLAN: r0=333(x1), r1=243(y1), r2=81(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=65(y), r7=21(width), r8=118(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 243
LDI r2, 81
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 65
LDI r7, 21
LDI r8, 118
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
