; DESCRIPTION: Creates a orange rectangular region at (362, 114) spanning 10 by 94 pixels.
; PLAN: r0=362(x), r1=114(y), r2=10(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 114
LDI r2, 10
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
