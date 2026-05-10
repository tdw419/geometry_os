; DESCRIPTION: Creates a yellow rectangular region at (46, 143) spanning 79 by 56 pixels.
; PLAN: r0=46(x), r1=143(y), r2=79(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 143
LDI r2, 79
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
