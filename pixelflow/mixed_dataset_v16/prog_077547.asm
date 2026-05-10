; DESCRIPTION: Creates a purple rectangular region at (131, 125) spanning 91 by 95 pixels.
; PLAN: r0=131(x), r1=125(y), r2=91(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 125
LDI r2, 91
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
