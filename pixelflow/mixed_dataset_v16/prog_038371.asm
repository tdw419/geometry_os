; DESCRIPTION: Creates a red rectangular region at (418, 173) spanning 58 by 29 pixels.
; PLAN: r0=418(x), r1=173(y), r2=58(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 173
LDI r2, 58
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
