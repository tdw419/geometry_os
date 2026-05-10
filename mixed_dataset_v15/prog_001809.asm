; DESCRIPTION: Places a white circle of radius 15 at center (485, 180).
; PLAN: r0=485(x), r1=180(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 485
LDI r1, 180
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
