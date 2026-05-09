; DESCRIPTION: Renders a cyan disk with center (307, 56) and radius 41.
; PLAN: r0=307(x), r1=56(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 56
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
