; DESCRIPTION: Creates a blue rectangular region at (27, 31) spanning 28 by 47 pixels.
; PLAN: r0=27(x), r1=31(y), r2=28(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 31
LDI r2, 28
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
