; DESCRIPTION: Creates a blue circular shape at (301, 205) with radius 42.
; PLAN: r0=301(x), r1=205(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 205
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
