; DESCRIPTION: Creates a blue rectangular region at (54, 89) spanning 42 by 64 pixels.
; PLAN: r0=54(x), r1=89(y), r2=42(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 89
LDI r2, 42
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
