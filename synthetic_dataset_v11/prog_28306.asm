; DESCRIPTION: Creates a yellow rectangular region at (3, 127) spanning 80 by 82 pixels.
; PLAN: r0=3(x), r1=127(y), r2=80(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 127
LDI r2, 80
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
