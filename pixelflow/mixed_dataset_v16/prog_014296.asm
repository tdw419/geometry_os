; DESCRIPTION: Creates a red rectangular region at (415, 96) spanning 47 by 94 pixels.
; PLAN: r0=415(x), r1=96(y), r2=47(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 96
LDI r2, 47
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
