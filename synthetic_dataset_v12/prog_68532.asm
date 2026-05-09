; DESCRIPTION: Creates a purple rectangular region at (146, 55) spanning 63 by 47 pixels.
; PLAN: r0=146(x), r1=55(y), r2=63(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 55
LDI r2, 63
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
