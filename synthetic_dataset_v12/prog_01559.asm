; DESCRIPTION: Creates a blue rectangular region at (330, 18) spanning 22 by 82 pixels.
; PLAN: r0=330(x), r1=18(y), r2=22(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 18
LDI r2, 22
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
