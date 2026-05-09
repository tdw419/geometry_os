; DESCRIPTION: Creates a blue rectangular region at (221, 21) spanning 34 by 36 pixels.
; PLAN: r0=221(x), r1=21(y), r2=34(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 21
LDI r2, 34
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
