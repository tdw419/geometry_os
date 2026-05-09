; DESCRIPTION: Creates a blue rectangular region at (384, 177) spanning 98 by 10 pixels.
; PLAN: r0=384(x), r1=177(y), r2=98(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 177
LDI r2, 98
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
