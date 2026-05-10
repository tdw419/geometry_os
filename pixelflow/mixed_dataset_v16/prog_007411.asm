; DESCRIPTION: Creates a orange rectangular region at (70, 54) spanning 103 by 15 pixels.
; PLAN: r0=70(x), r1=54(y), r2=103(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 54
LDI r2, 103
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
