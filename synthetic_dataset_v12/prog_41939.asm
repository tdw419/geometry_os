; DESCRIPTION: Creates a black rectangular region at (215, 61) spanning 113 by 113 pixels.
; PLAN: r0=215(x), r1=61(y), r2=113(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 61
LDI r2, 113
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
