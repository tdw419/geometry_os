; DESCRIPTION: Creates a black rectangular region at (342, 209) spanning 37 by 46 pixels.
; PLAN: r0=342(x), r1=209(y), r2=37(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 209
LDI r2, 37
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
