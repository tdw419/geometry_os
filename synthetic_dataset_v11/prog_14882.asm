; DESCRIPTION: Creates a black rectangular region at (127, 154) spanning 77 by 77 pixels.
; PLAN: r0=127(x), r1=154(y), r2=77(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 154
LDI r2, 77
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
