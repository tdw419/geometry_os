; DESCRIPTION: Creates a white rectangular region at (213, 180) spanning 31 by 25 pixels.
; PLAN: r0=213(x), r1=180(y), r2=31(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 180
LDI r2, 31
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
