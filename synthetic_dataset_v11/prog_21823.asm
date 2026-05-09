; DESCRIPTION: Creates a cyan circular shape at (193, 68) with radius 42.
; PLAN: r0=193(x), r1=68(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 68
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
