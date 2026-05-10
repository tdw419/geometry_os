; DESCRIPTION: Creates a purple rectangular region at (250, 239) spanning 40 by 10 pixels.
; PLAN: r0=250(x), r1=239(y), r2=40(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 239
LDI r2, 40
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
