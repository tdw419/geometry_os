; DESCRIPTION: Renders a cyan disk with center (196, 46) and radius 43.
; PLAN: r0=196(x), r1=46(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 46
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
