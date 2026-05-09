; DESCRIPTION: Creates a purple rectangular region at (255, 36) spanning 54 by 22 pixels.
; PLAN: r0=255(x), r1=36(y), r2=54(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 36
LDI r2, 54
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
