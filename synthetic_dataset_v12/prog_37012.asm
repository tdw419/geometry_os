; DESCRIPTION: Creates a purple rectangular region at (236, 146) spanning 21 by 83 pixels.
; PLAN: r0=236(x), r1=146(y), r2=21(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 146
LDI r2, 21
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
