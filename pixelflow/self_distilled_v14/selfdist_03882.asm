; DESCRIPTION: Renders a cyan circular shape at (323, 167) with radius 27.
; PLAN: r0=323(x), r1=167(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 167
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
