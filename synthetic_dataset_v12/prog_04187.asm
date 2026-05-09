; DESCRIPTION: Creates a purple rectangular region at (352, 27) spanning 63 by 109 pixels.
; PLAN: r0=352(x), r1=27(y), r2=63(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 27
LDI r2, 63
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
