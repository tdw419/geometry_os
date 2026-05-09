; DESCRIPTION: Creates a black rectangular region at (150, 114) spanning 79 by 63 pixels.
; PLAN: r0=150(x), r1=114(y), r2=79(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 114
LDI r2, 79
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
