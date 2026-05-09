; DESCRIPTION: Creates a blue rectangular region at (401, 113) spanning 70 by 103 pixels.
; PLAN: r0=401(x), r1=113(y), r2=70(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 113
LDI r2, 70
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
