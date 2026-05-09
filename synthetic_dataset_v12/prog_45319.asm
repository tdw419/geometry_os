; DESCRIPTION: Creates a yellow rectangular region at (392, 102) spanning 105 by 93 pixels.
; PLAN: r0=392(x), r1=102(y), r2=105(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 102
LDI r2, 105
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
