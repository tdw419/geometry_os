; DESCRIPTION: Creates a black rectangular region at (94, 149) spanning 112 by 60 pixels.
; PLAN: r0=94(x), r1=149(y), r2=112(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 149
LDI r2, 112
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
