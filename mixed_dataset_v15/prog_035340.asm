; DESCRIPTION: Creates a green circular shape at (207, 213) with radius 16.
; PLAN: r0=207(x), r1=213(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 213
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
