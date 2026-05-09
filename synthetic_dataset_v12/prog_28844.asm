; DESCRIPTION: Creates a orange rectangular region at (0, 194) spanning 103 by 54 pixels.
; PLAN: r0=0(x), r1=194(y), r2=103(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 194
LDI r2, 103
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
