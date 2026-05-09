; DESCRIPTION: Composite: . Then Places a orange line segment connecting (199, 115) to (96, 249). Then Renders a yellow box of size 96x95 starting at (65, 78).
; PLAN: r0=199(x1), r1=115(y1), r2=96(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=65(x), r1=78(y), r2=96(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (199, 115) to (96, 249).
; PLAN: r0=199(x1), r1=115(y1), r2=96(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 115
LDI r2, 96
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow box of size 96x95 starting at (65, 78).
; PLAN: r0=65(x), r1=78(y), r2=96(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 78
LDI r2, 96
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
