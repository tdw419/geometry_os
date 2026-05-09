; DESCRIPTION: Composite: . Then Draws a black line from (229, 8) to (104, 224). Then Creates a orange rectangular region at (159, 116) spanning 61 by 119 pixels.
; PLAN: r0=229(x1), r1=8(y1), r2=104(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=159(x), r1=116(y), r2=61(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (229, 8) to (104, 224).
; PLAN: r0=229(x1), r1=8(y1), r2=104(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 8
LDI r2, 104
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange rectangular region at (159, 116) spanning 61 by 119 pixels.
; PLAN: r0=159(x), r1=116(y), r2=61(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 116
LDI r2, 61
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
