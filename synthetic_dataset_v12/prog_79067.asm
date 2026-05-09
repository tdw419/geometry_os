; DESCRIPTION: Creates a yellow rectangular region at (238, 127) spanning 40 by 64 pixels.
; PLAN: r0=238(x), r1=127(y), r2=40(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 127
LDI r2, 40
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
