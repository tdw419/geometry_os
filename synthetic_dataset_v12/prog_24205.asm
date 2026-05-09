; DESCRIPTION: Creates a green rectangular region at (12, 146) spanning 51 by 48 pixels.
; PLAN: r0=12(x), r1=146(y), r2=51(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 146
LDI r2, 51
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
