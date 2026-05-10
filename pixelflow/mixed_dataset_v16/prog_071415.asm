; DESCRIPTION: Renders a cyan circular shape at (113, 62) with radius 70.
; PLAN: r0=113(x), r1=62(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 62
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
