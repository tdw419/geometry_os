; DESCRIPTION: Creates a blue rectangular region at (32, 143) spanning 86 by 102 pixels.
; PLAN: r0=32(x), r1=143(y), r2=86(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 143
LDI r2, 86
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
