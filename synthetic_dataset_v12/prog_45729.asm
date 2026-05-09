; DESCRIPTION: Creates a cyan circular shape at (264, 91) with radius 80.
; PLAN: r0=264(x), r1=91(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 91
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
