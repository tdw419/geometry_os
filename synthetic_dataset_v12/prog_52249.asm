; DESCRIPTION: Creates a yellow rectangular region at (86, 16) spanning 62 by 120 pixels.
; PLAN: r0=86(x), r1=16(y), r2=62(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 16
LDI r2, 62
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
