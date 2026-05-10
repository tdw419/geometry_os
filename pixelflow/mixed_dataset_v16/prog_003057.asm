; DESCRIPTION: Creates a blue rectangular region at (21, 57) spanning 28 by 74 pixels.
; PLAN: r0=21(x), r1=57(y), r2=28(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 57
LDI r2, 28
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
