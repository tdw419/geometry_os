; DESCRIPTION: Creates a blue rectangular region at (243, 178) spanning 40 by 36 pixels.
; PLAN: r0=243(x), r1=178(y), r2=40(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 178
LDI r2, 40
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
