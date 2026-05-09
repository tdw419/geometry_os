; DESCRIPTION: Creates a purple rectangular region at (307, 18) spanning 40 by 48 pixels.
; PLAN: r0=307(x), r1=18(y), r2=40(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 18
LDI r2, 40
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
