; DESCRIPTION: Composite: Places a white circle of radius 41 at center (58, 53) then Creates a purple rectangular region at (191, 59) spanning 77 by 79 pixels.
; PLAN: r0=58(x), r1=53(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x), r6=59(y), r7=77(width), r8=79(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 53
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 59
LDI r7, 77
LDI r8, 79
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
