; DESCRIPTION: Creates a green rectangular region at (257, 42) spanning 70 by 80 pixels.
; PLAN: r0=257(x), r1=42(y), r2=70(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 42
LDI r2, 70
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
