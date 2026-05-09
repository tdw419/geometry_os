; DESCRIPTION: Creates a black rectangular region at (375, 48) spanning 59 by 27 pixels.
; PLAN: r0=375(x), r1=48(y), r2=59(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 48
LDI r2, 59
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
