; DESCRIPTION: Creates a purple rectangular region at (157, 196) spanning 63 by 59 pixels.
; PLAN: r0=157(x), r1=196(y), r2=63(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 196
LDI r2, 63
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
