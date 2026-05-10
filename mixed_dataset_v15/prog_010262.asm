; DESCRIPTION: Renders a cyan circular shape at (175, 46) with radius 80.
; PLAN: r0=175(x), r1=46(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 46
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
