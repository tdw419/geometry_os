; DESCRIPTION: Creates a purple rectangular region at (243, 184) spanning 34 by 26 pixels.
; PLAN: r0=243(x), r1=184(y), r2=34(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 184
LDI r2, 34
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
