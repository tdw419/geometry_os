; DESCRIPTION: Creates a orange rectangular region at (92, 107) spanning 85 by 15 pixels.
; PLAN: r0=92(x), r1=107(y), r2=85(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 107
LDI r2, 85
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
