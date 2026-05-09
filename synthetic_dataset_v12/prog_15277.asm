; DESCRIPTION: Creates a red rectangular region at (356, 81) spanning 81 by 111 pixels.
; PLAN: r0=356(x), r1=81(y), r2=81(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 81
LDI r2, 81
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
