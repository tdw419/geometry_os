; DESCRIPTION: Creates a purple rectangular region at (146, 26) spanning 86 by 92 pixels.
; PLAN: r0=146(x), r1=26(y), r2=86(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 26
LDI r2, 86
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
