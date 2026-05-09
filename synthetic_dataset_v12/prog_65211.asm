; DESCRIPTION: Creates a red rectangular region at (29, 120) spanning 112 by 84 pixels.
; PLAN: r0=29(x), r1=120(y), r2=112(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 120
LDI r2, 112
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
