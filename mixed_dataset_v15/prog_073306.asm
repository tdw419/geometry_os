; DESCRIPTION: Creates a blue rectangular region at (289, 67) spanning 42 by 30 pixels.
; PLAN: r0=289(x), r1=67(y), r2=42(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 67
LDI r2, 42
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
