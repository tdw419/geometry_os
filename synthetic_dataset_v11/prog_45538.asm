; DESCRIPTION: Composite: . Then Places a purple line segment connecting (254, 95) to (39, 229). Then Renders a cyan box of size 86x88 starting at (48, 5).
; PLAN: r0=254(x1), r1=95(y1), r2=39(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=48(x), r1=5(y), r2=86(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (254, 95) to (39, 229).
; PLAN: r0=254(x1), r1=95(y1), r2=39(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 95
LDI r2, 39
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan box of size 86x88 starting at (48, 5).
; PLAN: r0=48(x), r1=5(y), r2=86(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 5
LDI r2, 86
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
