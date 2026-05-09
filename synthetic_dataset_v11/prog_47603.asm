; DESCRIPTION: Creates a blue rectangular region at (174, 153) spanning 36 by 60 pixels.
; PLAN: r0=174(x), r1=153(y), r2=36(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 153
LDI r2, 36
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
