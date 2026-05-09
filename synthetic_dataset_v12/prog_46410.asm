; DESCRIPTION: Creates a blue rectangular region at (24, 151) spanning 18 by 59 pixels.
; PLAN: r0=24(x), r1=151(y), r2=18(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 151
LDI r2, 18
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
