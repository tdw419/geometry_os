; DESCRIPTION: Creates a blue rectangular region at (188, 47) spanning 57 by 71 pixels.
; PLAN: r0=188(x), r1=47(y), r2=57(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 47
LDI r2, 57
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
