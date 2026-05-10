; DESCRIPTION: Creates a blue rectangular region at (213, 9) spanning 16 by 59 pixels.
; PLAN: r0=213(x), r1=9(y), r2=16(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 9
LDI r2, 16
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
