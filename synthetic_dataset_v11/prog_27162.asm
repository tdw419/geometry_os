; DESCRIPTION: Renders a cyan disk with center (82, 164) and radius 43.
; PLAN: r0=82(x), r1=164(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 164
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
