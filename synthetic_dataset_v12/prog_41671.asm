; DESCRIPTION: Creates a cyan circular shape at (213, 166) with radius 44.
; PLAN: r0=213(x), r1=166(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 166
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
