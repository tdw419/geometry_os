; DESCRIPTION: Creates a blue rectangular region at (352, 28) spanning 92 by 68 pixels.
; PLAN: r0=352(x), r1=28(y), r2=92(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 28
LDI r2, 92
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
