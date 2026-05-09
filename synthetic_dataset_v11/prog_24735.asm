; DESCRIPTION: Creates a blue rectangular region at (57, 126) spanning 103 by 42 pixels.
; PLAN: r0=57(x), r1=126(y), r2=103(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 126
LDI r2, 103
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
