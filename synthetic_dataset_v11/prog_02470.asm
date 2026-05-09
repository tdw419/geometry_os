; DESCRIPTION: Renders a cyan disk with center (166, 97) and radius 74.
; PLAN: r0=166(x), r1=97(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 97
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
