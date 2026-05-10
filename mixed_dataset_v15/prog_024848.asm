; DESCRIPTION: Creates a red rectangular region at (64, 136) spanning 47 by 120 pixels.
; PLAN: r0=64(x), r1=136(y), r2=47(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 136
LDI r2, 47
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
