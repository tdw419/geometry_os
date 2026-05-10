; DESCRIPTION: Renders a cyan disk with center (117, 213) and radius 43.
; PLAN: r0=117(x), r1=213(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 213
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
