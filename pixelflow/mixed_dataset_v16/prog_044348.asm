; DESCRIPTION: Creates a yellow rectangular region at (470, 140) spanning 36 by 54 pixels.
; PLAN: r0=470(x), r1=140(y), r2=36(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 140
LDI r2, 36
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
