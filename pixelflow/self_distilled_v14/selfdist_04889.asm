; DESCRIPTION: Renders a cyan circular shape at (23, 162) with radius 12.
; PLAN: r0=23(x), r1=162(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 23
LDI r1, 162
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
