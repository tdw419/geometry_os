; DESCRIPTION: Renders a cyan disk with center (222, 41) and radius 22.
; PLAN: r0=222(x), r1=41(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 41
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
