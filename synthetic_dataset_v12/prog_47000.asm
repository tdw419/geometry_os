; DESCRIPTION: Creates a white rectangular region at (408, 16) spanning 99 by 46 pixels.
; PLAN: r0=408(x), r1=16(y), r2=99(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 16
LDI r2, 99
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
