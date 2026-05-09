; DESCRIPTION: Creates a blue rectangular region at (403, 135) spanning 45 by 81 pixels.
; PLAN: r0=403(x), r1=135(y), r2=45(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 135
LDI r2, 45
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
