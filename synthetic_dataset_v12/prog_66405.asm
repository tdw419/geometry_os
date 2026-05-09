; DESCRIPTION: Creates a yellow rectangular region at (425, 141) spanning 63 by 67 pixels.
; PLAN: r0=425(x), r1=141(y), r2=63(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 141
LDI r2, 63
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
