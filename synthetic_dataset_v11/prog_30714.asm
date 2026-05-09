; DESCRIPTION: Creates a blue rectangular region at (197, 87) spanning 11 by 59 pixels.
; PLAN: r0=197(x), r1=87(y), r2=11(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 87
LDI r2, 11
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
