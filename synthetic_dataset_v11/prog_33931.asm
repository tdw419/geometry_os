; DESCRIPTION: Creates a yellow rectangular region at (113, 32) spanning 47 by 92 pixels.
; PLAN: r0=113(x), r1=32(y), r2=47(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 32
LDI r2, 47
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
