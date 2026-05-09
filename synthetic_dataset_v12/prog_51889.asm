; DESCRIPTION: Creates a purple rectangular region at (146, 86) spanning 81 by 79 pixels.
; PLAN: r0=146(x), r1=86(y), r2=81(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 86
LDI r2, 81
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
