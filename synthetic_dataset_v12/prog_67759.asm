; DESCRIPTION: Creates a purple rectangular region at (120, 171) spanning 112 by 27 pixels.
; PLAN: r0=120(x), r1=171(y), r2=112(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 171
LDI r2, 112
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
