; DESCRIPTION: Creates a black rectangular region at (48, 178) spanning 113 by 19 pixels.
; PLAN: r0=48(x), r1=178(y), r2=113(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 178
LDI r2, 113
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
