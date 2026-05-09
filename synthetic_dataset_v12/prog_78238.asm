; DESCRIPTION: Creates a red rectangular region at (48, 142) spanning 35 by 61 pixels.
; PLAN: r0=48(x), r1=142(y), r2=35(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 142
LDI r2, 35
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
