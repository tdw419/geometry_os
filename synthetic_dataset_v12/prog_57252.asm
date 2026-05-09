; DESCRIPTION: Creates a purple rectangular region at (401, 189) spanning 28 by 19 pixels.
; PLAN: r0=401(x), r1=189(y), r2=28(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 189
LDI r2, 28
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
