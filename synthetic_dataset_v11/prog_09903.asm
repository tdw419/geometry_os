; DESCRIPTION: Composite: . Then Places a black dot at position (69, 74). Then Creates a yellow rectangular region at (110, 203) spanning 44 by 52 pixels.
; PLAN: r0=69(x), r1=74(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=110(x), r1=203(y), r2=44(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (69, 74).
; PLAN: r0=69(x), r1=74(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 74
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (110, 203) spanning 44 by 52 pixels.
; PLAN: r0=110(x), r1=203(y), r2=44(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 203
LDI r2, 44
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
