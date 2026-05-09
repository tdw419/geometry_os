; DESCRIPTION: Creates a black rectangular region at (18, 164) spanning 39 by 48 pixels.
; PLAN: r0=18(x), r1=164(y), r2=39(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 164
LDI r2, 39
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
