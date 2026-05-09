; DESCRIPTION: Creates a black rectangular region at (120, 59) spanning 79 by 27 pixels.
; PLAN: r0=120(x), r1=59(y), r2=79(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 59
LDI r2, 79
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
