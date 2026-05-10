; DESCRIPTION: Creates a black rectangular region at (143, 59) spanning 10 by 20 pixels.
; PLAN: r0=143(x), r1=59(y), r2=10(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 59
LDI r2, 10
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
