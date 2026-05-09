; DESCRIPTION: Creates a black rectangular region at (293, 33) spanning 92 by 102 pixels.
; PLAN: r0=293(x), r1=33(y), r2=92(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 33
LDI r2, 92
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
