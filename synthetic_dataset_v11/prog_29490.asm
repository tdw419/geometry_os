; DESCRIPTION: Creates a blue rectangular region at (52, 27) spanning 67 by 48 pixels.
; PLAN: r0=52(x), r1=27(y), r2=67(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 27
LDI r2, 67
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
