; DESCRIPTION: Creates a orange rectangular region at (249, 120) spanning 15 by 103 pixels.
; PLAN: r0=249(x), r1=120(y), r2=15(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 120
LDI r2, 15
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
