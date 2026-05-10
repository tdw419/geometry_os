; DESCRIPTION: Creates a blue rectangular region at (112, 133) spanning 42 by 37 pixels.
; PLAN: r0=112(x), r1=133(y), r2=42(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 133
LDI r2, 42
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
