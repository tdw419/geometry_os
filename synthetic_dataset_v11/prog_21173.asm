; DESCRIPTION: Creates a white rectangular region at (16, 143) spanning 19 by 27 pixels.
; PLAN: r0=16(x), r1=143(y), r2=19(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 143
LDI r2, 19
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
