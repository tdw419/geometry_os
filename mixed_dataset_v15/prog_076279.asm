; DESCRIPTION: Creates a white rectangular region at (303, 191) spanning 22 by 59 pixels.
; PLAN: r0=303(x), r1=191(y), r2=22(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 191
LDI r2, 22
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
