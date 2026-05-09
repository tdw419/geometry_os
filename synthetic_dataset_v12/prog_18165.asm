; DESCRIPTION: Creates a cyan circular shape at (167, 188) with radius 25.
; PLAN: r0=167(x), r1=188(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 188
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
