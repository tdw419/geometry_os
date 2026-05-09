; DESCRIPTION: Creates a blue rectangular region at (72, 42) spanning 111 by 95 pixels.
; PLAN: r0=72(x), r1=42(y), r2=111(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 42
LDI r2, 111
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
