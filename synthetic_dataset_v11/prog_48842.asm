; DESCRIPTION: Creates a purple rectangular region at (174, 140) spanning 32 by 59 pixels.
; PLAN: r0=174(x), r1=140(y), r2=32(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 140
LDI r2, 32
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
