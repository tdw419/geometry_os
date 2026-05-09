; DESCRIPTION: Renders a cyan disk with center (447, 133) and radius 41.
; PLAN: r0=447(x), r1=133(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 133
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
