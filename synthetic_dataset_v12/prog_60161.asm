; DESCRIPTION: Creates a orange rectangular region at (234, 107) spanning 120 by 20 pixels.
; PLAN: r0=234(x), r1=107(y), r2=120(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 107
LDI r2, 120
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
