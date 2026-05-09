; DESCRIPTION: Creates a orange rectangular region at (103, 112) spanning 14 by 68 pixels.
; PLAN: r0=103(x), r1=112(y), r2=14(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 112
LDI r2, 14
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
