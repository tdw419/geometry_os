; DESCRIPTION: Creates a cyan circular shape at (154, 133) with radius 78.
; PLAN: r0=154(x), r1=133(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 133
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
