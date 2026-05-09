; DESCRIPTION: Creates a cyan rectangular region at (382, 54) spanning 40 by 62 pixels.
; PLAN: r0=382(x), r1=54(y), r2=40(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 54
LDI r2, 40
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
