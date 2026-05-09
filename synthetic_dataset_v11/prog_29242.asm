; DESCRIPTION: Creates a blue rectangular region at (10, 146) spanning 81 by 67 pixels.
; PLAN: r0=10(x), r1=146(y), r2=81(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 146
LDI r2, 81
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
