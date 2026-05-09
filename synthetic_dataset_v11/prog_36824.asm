; DESCRIPTION: Creates a yellow rectangular region at (92, 64) spanning 117 by 52 pixels.
; PLAN: r0=92(x), r1=64(y), r2=117(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 64
LDI r2, 117
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
