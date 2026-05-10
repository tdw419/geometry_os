; DESCRIPTION: Creates a green circular shape at (146, 104) with radius 21.
; PLAN: r0=146(x), r1=104(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 104
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
