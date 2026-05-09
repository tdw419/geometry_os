; DESCRIPTION: Composite: . Then Places a cyan circle of radius 27 at center (176, 34). Then Places a orange line segment connecting (133, 210) to (84, 78).
; PLAN: r0=176(x), r1=34(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=133(x1), r1=210(y1), r2=84(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 27 at center (176, 34).
; PLAN: r0=176(x), r1=34(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 34
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange line segment connecting (133, 210) to (84, 78).
; PLAN: r0=133(x1), r1=210(y1), r2=84(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 210
LDI r2, 84
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
