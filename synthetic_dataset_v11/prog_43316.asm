; DESCRIPTION: Creates a red rectangular region at (173, 125) spanning 63 by 100 pixels.
; PLAN: r0=173(x), r1=125(y), r2=63(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 125
LDI r2, 63
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
