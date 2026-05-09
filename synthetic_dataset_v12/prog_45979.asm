; DESCRIPTION: Creates a black rectangular region at (277, 6) spanning 102 by 25 pixels.
; PLAN: r0=277(x), r1=6(y), r2=102(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 6
LDI r2, 102
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
