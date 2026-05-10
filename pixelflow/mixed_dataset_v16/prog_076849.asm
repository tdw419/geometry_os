; DESCRIPTION: Creates a blue rectangular region at (265, 142) spanning 109 by 38 pixels.
; PLAN: r0=265(x), r1=142(y), r2=109(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 142
LDI r2, 109
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
