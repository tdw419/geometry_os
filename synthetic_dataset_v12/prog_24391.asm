; DESCRIPTION: Renders a cyan disk with center (181, 197) and radius 52.
; PLAN: r0=181(x), r1=197(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 197
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
