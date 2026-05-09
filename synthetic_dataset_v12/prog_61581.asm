; DESCRIPTION: Creates a green circular shape at (213, 186) with radius 34.
; PLAN: r0=213(x), r1=186(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 186
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
