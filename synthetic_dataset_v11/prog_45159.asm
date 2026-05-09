; DESCRIPTION: Renders a cyan disk with center (130, 205) and radius 36.
; PLAN: r0=130(x), r1=205(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 205
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
