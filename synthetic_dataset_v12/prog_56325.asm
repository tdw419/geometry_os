; DESCRIPTION: Renders a cyan disk with center (277, 141) and radius 41.
; PLAN: r0=277(x), r1=141(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 141
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
