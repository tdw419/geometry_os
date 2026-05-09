; DESCRIPTION: Creates a blue rectangular region at (319, 221) spanning 65 by 13 pixels.
; PLAN: r0=319(x), r1=221(y), r2=65(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 221
LDI r2, 65
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
