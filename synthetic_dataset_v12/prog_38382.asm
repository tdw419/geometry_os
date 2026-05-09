; DESCRIPTION: Creates a blue rectangular region at (464, 73) spanning 29 by 115 pixels.
; PLAN: r0=464(x), r1=73(y), r2=29(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 73
LDI r2, 29
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
