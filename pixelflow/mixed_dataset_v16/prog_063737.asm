; DESCRIPTION: Creates a blue rectangular region at (268, 111) spanning 16 by 14 pixels.
; PLAN: r0=268(x), r1=111(y), r2=16(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 111
LDI r2, 16
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
