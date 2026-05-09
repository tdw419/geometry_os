; DESCRIPTION: Creates a yellow rectangular region at (92, 144) spanning 111 by 95 pixels.
; PLAN: r0=92(x), r1=144(y), r2=111(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 144
LDI r2, 111
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
