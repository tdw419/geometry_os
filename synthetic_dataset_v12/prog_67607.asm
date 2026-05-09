; DESCRIPTION: Creates a green circular shape at (465, 209) with radius 43.
; PLAN: r0=465(x), r1=209(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 209
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
