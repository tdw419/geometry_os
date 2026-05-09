; DESCRIPTION: Creates a green circular shape at (242, 95) with radius 27.
; PLAN: r0=242(x), r1=95(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 95
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
