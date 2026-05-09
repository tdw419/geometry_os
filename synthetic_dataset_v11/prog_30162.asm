; DESCRIPTION: Creates a cyan circular shape at (135, 50) with radius 40.
; PLAN: r0=135(x), r1=50(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 50
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
