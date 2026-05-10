; DESCRIPTION: Renders a cyan circular shape at (16, 151) with radius 28.
; PLAN: r0=16(x), r1=151(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 16
LDI r1, 151
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
