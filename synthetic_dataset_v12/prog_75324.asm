; DESCRIPTION: Creates a red rectangular region at (164, 77) spanning 120 by 31 pixels.
; PLAN: r0=164(x), r1=77(y), r2=120(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 77
LDI r2, 120
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
