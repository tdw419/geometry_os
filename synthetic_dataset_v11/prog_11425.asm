; DESCRIPTION: Creates a cyan circular shape at (69, 196) with radius 50.
; PLAN: r0=69(x), r1=196(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 196
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
