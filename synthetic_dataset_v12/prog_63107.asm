; DESCRIPTION: Creates a green rectangular region at (114, 177) spanning 47 by 77 pixels.
; PLAN: r0=114(x), r1=177(y), r2=47(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 177
LDI r2, 47
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
