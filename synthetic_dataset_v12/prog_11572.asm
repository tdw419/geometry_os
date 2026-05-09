; DESCRIPTION: Creates a orange rectangular region at (350, 103) spanning 71 by 81 pixels.
; PLAN: r0=350(x), r1=103(y), r2=71(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 103
LDI r2, 71
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
