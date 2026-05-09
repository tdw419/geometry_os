; DESCRIPTION: Creates a orange rectangular region at (262, 114) spanning 115 by 70 pixels.
; PLAN: r0=262(x), r1=114(y), r2=115(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 114
LDI r2, 115
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
