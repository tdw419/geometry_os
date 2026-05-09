; DESCRIPTION: Creates a blue rectangular region at (401, 114) spanning 63 by 63 pixels.
; PLAN: r0=401(x), r1=114(y), r2=63(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 114
LDI r2, 63
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
