; DESCRIPTION: Creates a blue rectangular region at (392, 42) spanning 12 by 32 pixels.
; PLAN: r0=392(x), r1=42(y), r2=12(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 42
LDI r2, 12
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
