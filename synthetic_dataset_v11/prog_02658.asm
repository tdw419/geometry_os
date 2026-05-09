; DESCRIPTION: Creates a blue rectangular region at (106, 204) spanning 43 by 32 pixels.
; PLAN: r0=106(x), r1=204(y), r2=43(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 204
LDI r2, 43
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
