; DESCRIPTION: Creates a blue rectangular region at (95, 27) spanning 34 by 32 pixels.
; PLAN: r0=95(x), r1=27(y), r2=34(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 27
LDI r2, 34
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
