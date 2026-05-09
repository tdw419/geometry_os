; DESCRIPTION: Creates a blue rectangular region at (374, 40) spanning 42 by 42 pixels.
; PLAN: r0=374(x), r1=40(y), r2=42(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 40
LDI r2, 42
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
