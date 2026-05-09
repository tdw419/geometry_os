; DESCRIPTION: Creates a purple rectangular region at (106, 149) spanning 64 by 50 pixels.
; PLAN: r0=106(x), r1=149(y), r2=64(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 149
LDI r2, 64
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
