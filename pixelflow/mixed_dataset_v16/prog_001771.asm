; DESCRIPTION: Composite: Places a white line segment connecting (360, 3) to (369, 238) then Renders a red box of size 118x93 starting at (218, 132).
; PLAN: r0=360(x1), r1=3(y1), r2=369(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=132(y), r7=118(width), r8=93(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 3
LDI r2, 369
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 132
LDI r7, 118
LDI r8, 93
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
