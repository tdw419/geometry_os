; DESCRIPTION: Creates a red rectangular region at (391, 63) spanning 103 by 115 pixels.
; PLAN: r0=391(x), r1=63(y), r2=103(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 63
LDI r2, 103
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
