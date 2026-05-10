; DESCRIPTION: Creates a white filled rectangle of size 63x65 starting at (372, 139).
; PLAN: r0=372(x), r1=139(y), r2=63(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 139
LDI r2, 63
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
