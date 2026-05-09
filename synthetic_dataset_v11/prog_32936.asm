; DESCRIPTION: Renders a cyan disk with center (36, 166) and radius 32.
; PLAN: r0=36(x), r1=166(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 166
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
