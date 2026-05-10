; DESCRIPTION: Renders a cyan circular shape at (300, 193) with radius 43.
; PLAN: r0=300(x), r1=193(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 193
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
