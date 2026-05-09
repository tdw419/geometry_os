; DESCRIPTION: Creates a white rectangular region at (313, 160) spanning 45 by 80 pixels.
; PLAN: r0=313(x), r1=160(y), r2=45(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 160
LDI r2, 45
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
