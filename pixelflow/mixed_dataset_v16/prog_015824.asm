; DESCRIPTION: Creates a red rectangular region at (418, 132) spanning 17 by 103 pixels.
; PLAN: r0=418(x), r1=132(y), r2=17(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 132
LDI r2, 17
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
