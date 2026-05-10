; DESCRIPTION: Creates a blue rectangular region at (294, 167) spanning 31 by 25 pixels.
; PLAN: r0=294(x), r1=167(y), r2=31(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 167
LDI r2, 31
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
