; DESCRIPTION: Creates a black rectangular region at (293, 0) spanning 10 by 90 pixels.
; PLAN: r0=293(x), r1=0(y), r2=10(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 0
LDI r2, 10
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
