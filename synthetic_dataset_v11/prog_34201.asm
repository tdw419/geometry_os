; DESCRIPTION: Renders a cyan disk with center (154, 98) and radius 63.
; PLAN: r0=154(x), r1=98(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 98
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
