; DESCRIPTION: Creates a purple rectangular region at (246, 111) spanning 95 by 117 pixels.
; PLAN: r0=246(x), r1=111(y), r2=95(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 111
LDI r2, 95
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
