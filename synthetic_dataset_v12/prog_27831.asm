; DESCRIPTION: Creates a green rectangular region at (177, 167) spanning 16 by 17 pixels.
; PLAN: r0=177(x), r1=167(y), r2=16(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 167
LDI r2, 16
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
