; DESCRIPTION: Renders a cyan circular shape at (65, 61) with radius 50.
; PLAN: r0=65(x), r1=61(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 61
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
