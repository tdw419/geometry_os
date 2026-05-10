; DESCRIPTION: Renders a cyan disk with center (72, 180) and radius 22.
; PLAN: r0=72(x), r1=180(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 180
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
