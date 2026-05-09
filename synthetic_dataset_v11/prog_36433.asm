; DESCRIPTION: Creates a blue rectangular region at (95, 183) spanning 59 by 47 pixels.
; PLAN: r0=95(x), r1=183(y), r2=59(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 183
LDI r2, 59
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
