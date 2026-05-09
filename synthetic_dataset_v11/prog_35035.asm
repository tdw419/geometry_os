; DESCRIPTION: Creates a cyan circular shape at (127, 188) with radius 61.
; PLAN: r0=127(x), r1=188(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 188
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
