; DESCRIPTION: Creates a orange rectangular region at (177, 21) spanning 100 by 113 pixels.
; PLAN: r0=177(x), r1=21(y), r2=100(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 21
LDI r2, 100
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
