; DESCRIPTION: Creates a orange rectangular region at (177, 166) spanning 25 by 60 pixels.
; PLAN: r0=177(x), r1=166(y), r2=25(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 166
LDI r2, 25
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
