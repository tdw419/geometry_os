; DESCRIPTION: Creates a red rectangular region at (358, 173) spanning 43 by 45 pixels.
; PLAN: r0=358(x), r1=173(y), r2=43(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 173
LDI r2, 43
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
