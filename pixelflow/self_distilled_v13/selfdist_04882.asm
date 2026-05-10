; DESCRIPTION: Renders a cyan circular shape at (242, 54) with radius 13.
; PLAN: r0=242(x), r1=54(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 54
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
