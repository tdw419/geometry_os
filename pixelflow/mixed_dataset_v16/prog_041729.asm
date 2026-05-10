; DESCRIPTION: Creates a green rectangular region at (95, 142) spanning 112 by 47 pixels.
; PLAN: r0=95(x), r1=142(y), r2=112(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 142
LDI r2, 112
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
