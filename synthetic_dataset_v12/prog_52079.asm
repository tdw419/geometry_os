; DESCRIPTION: Creates a blue rectangular region at (285, 203) spanning 28 by 42 pixels.
; PLAN: r0=285(x), r1=203(y), r2=28(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 203
LDI r2, 28
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
