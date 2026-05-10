; DESCRIPTION: Creates a white filled rectangle of size 63x20 starting at (320, 32).
; PLAN: r0=320(x), r1=32(y), r2=63(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 32
LDI r2, 63
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
