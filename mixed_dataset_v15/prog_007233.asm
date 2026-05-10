; DESCRIPTION: Renders a cyan circular shape at (123, 48) with radius 16.
; PLAN: r0=123(x), r1=48(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 48
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
