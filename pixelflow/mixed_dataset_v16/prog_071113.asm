; DESCRIPTION: Creates a yellow rectangular region at (213, 14) spanning 38 by 111 pixels.
; PLAN: r0=213(x), r1=14(y), r2=38(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 14
LDI r2, 38
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
