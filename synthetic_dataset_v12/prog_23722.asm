; DESCRIPTION: Creates a red rectangular region at (164, 25) spanning 79 by 58 pixels.
; PLAN: r0=164(x), r1=25(y), r2=79(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 25
LDI r2, 79
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
