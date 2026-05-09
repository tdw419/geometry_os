; DESCRIPTION: Creates a white rectangular region at (291, 107) spanning 21 by 46 pixels.
; PLAN: r0=291(x), r1=107(y), r2=21(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 107
LDI r2, 21
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
