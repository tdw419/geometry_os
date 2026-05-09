; DESCRIPTION: Creates a orange rectangular region at (212, 197) spanning 102 by 54 pixels.
; PLAN: r0=212(x), r1=197(y), r2=102(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 197
LDI r2, 102
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
