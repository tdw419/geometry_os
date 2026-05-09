; DESCRIPTION: Renders a cyan disk with center (197, 121) and radius 29.
; PLAN: r0=197(x), r1=121(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 121
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
