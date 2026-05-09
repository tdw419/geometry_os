; DESCRIPTION: Creates a black rectangular region at (222, 150) spanning 59 by 28 pixels.
; PLAN: r0=222(x), r1=150(y), r2=59(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 150
LDI r2, 59
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
