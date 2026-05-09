; DESCRIPTION: Creates a cyan circular shape at (205, 111) with radius 68.
; PLAN: r0=205(x), r1=111(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 111
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
