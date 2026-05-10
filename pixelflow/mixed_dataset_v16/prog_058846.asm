; DESCRIPTION: Creates a black rectangular region at (59, 125) spanning 27 by 77 pixels.
; PLAN: r0=59(x), r1=125(y), r2=27(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 125
LDI r2, 27
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
