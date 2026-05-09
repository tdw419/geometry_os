; DESCRIPTION: Creates a yellow rectangular region at (107, 127) spanning 108 by 111 pixels.
; PLAN: r0=107(x), r1=127(y), r2=108(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 127
LDI r2, 108
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
