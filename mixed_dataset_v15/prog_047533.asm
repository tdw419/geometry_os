; DESCRIPTION: Creates a orange rectangular region at (52, 197) spanning 114 by 14 pixels.
; PLAN: r0=52(x), r1=197(y), r2=114(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 197
LDI r2, 114
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
