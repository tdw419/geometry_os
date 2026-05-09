; DESCRIPTION: Creates a green rectangular region at (48, 111) spanning 101 by 103 pixels.
; PLAN: r0=48(x), r1=111(y), r2=101(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 111
LDI r2, 101
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
