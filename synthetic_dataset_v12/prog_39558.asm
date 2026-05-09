; DESCRIPTION: Creates a blue rectangular region at (197, 72) spanning 37 by 22 pixels.
; PLAN: r0=197(x), r1=72(y), r2=37(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 72
LDI r2, 37
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
