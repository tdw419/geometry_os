; DESCRIPTION: Creates a purple rectangular region at (243, 149) spanning 111 by 100 pixels.
; PLAN: r0=243(x), r1=149(y), r2=111(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 149
LDI r2, 111
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
