; DESCRIPTION: Creates a cyan circular shape at (135, 82) with radius 80.
; PLAN: r0=135(x), r1=82(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 82
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
