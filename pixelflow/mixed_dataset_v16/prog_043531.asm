; DESCRIPTION: Creates a green rectangular region at (92, 134) spanning 113 by 37 pixels.
; PLAN: r0=92(x), r1=134(y), r2=113(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 134
LDI r2, 113
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
