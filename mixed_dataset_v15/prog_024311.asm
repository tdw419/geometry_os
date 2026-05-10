; DESCRIPTION: Creates a black rectangular region at (207, 146) spanning 68 by 63 pixels.
; PLAN: r0=207(x), r1=146(y), r2=68(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 146
LDI r2, 68
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
