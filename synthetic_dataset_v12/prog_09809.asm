; DESCRIPTION: Creates a purple rectangular region at (219, 194) spanning 19 by 27 pixels.
; PLAN: r0=219(x), r1=194(y), r2=19(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 194
LDI r2, 19
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
