; DESCRIPTION: Creates a white rectangular region at (91, 214) spanning 59 by 40 pixels.
; PLAN: r0=91(x), r1=214(y), r2=59(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 214
LDI r2, 59
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
