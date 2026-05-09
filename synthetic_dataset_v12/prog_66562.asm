; DESCRIPTION: Creates a blue rectangular region at (440, 76) spanning 59 by 117 pixels.
; PLAN: r0=440(x), r1=76(y), r2=59(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 76
LDI r2, 59
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
