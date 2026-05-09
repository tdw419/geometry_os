; DESCRIPTION: Creates a purple rectangular region at (177, 130) spanning 31 by 98 pixels.
; PLAN: r0=177(x), r1=130(y), r2=31(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 130
LDI r2, 31
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
