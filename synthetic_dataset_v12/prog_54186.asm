; DESCRIPTION: Creates a purple rectangular region at (32, 127) spanning 60 by 113 pixels.
; PLAN: r0=32(x), r1=127(y), r2=60(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 127
LDI r2, 60
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
