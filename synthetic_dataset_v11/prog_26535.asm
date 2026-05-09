; DESCRIPTION: Creates a orange rectangular region at (60, 197) spanning 26 by 44 pixels.
; PLAN: r0=60(x), r1=197(y), r2=26(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 197
LDI r2, 26
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
