; DESCRIPTION: Renders a cyan circular shape at (304, 185) with radius 50.
; PLAN: r0=304(x), r1=185(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 185
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
