; DESCRIPTION: Creates a green rectangular region at (95, 209) spanning 102 by 24 pixels.
; PLAN: r0=95(x), r1=209(y), r2=102(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 209
LDI r2, 102
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
