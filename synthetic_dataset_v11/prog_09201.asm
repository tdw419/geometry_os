; DESCRIPTION: Creates a red rectangular region at (143, 180) spanning 39 by 24 pixels.
; PLAN: r0=143(x), r1=180(y), r2=39(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 180
LDI r2, 39
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
