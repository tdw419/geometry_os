; DESCRIPTION: Creates a cyan circular shape at (180, 135) with radius 45.
; PLAN: r0=180(x), r1=135(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 135
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
