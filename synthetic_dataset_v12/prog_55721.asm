; DESCRIPTION: Creates a purple rectangular region at (146, 96) spanning 89 by 90 pixels.
; PLAN: r0=146(x), r1=96(y), r2=89(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 96
LDI r2, 89
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
