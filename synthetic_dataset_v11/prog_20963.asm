; DESCRIPTION: Creates a blue rectangular region at (70, 73) spanning 48 by 12 pixels.
; PLAN: r0=70(x), r1=73(y), r2=48(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 73
LDI r2, 48
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
