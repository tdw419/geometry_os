; DESCRIPTION: Renders a green disk with center (298, 42) and radius 39.
; PLAN: r0=298(x), r1=42(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 42
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
