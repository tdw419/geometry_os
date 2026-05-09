; DESCRIPTION: Creates a blue rectangular region at (67, 57) spanning 42 by 93 pixels.
; PLAN: r0=67(x), r1=57(y), r2=42(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 57
LDI r2, 42
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
