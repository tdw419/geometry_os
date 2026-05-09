; DESCRIPTION: Creates a blue rectangular region at (188, 206) spanning 109 by 29 pixels.
; PLAN: r0=188(x), r1=206(y), r2=109(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 206
LDI r2, 109
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
