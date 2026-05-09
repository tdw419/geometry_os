; DESCRIPTION: Creates a purple rectangular region at (227, 195) spanning 17 by 59 pixels.
; PLAN: r0=227(x), r1=195(y), r2=17(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 195
LDI r2, 17
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
