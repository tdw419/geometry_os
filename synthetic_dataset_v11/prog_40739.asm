; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (169, 104) spanning 55 by 85 pixels. Then Places a orange dot at position (51, 21).
; PLAN: r0=169(x), r1=104(y), r2=55(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=51(x), r1=21(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a purple rectangular region at (169, 104) spanning 55 by 85 pixels.
; PLAN: r0=169(x), r1=104(y), r2=55(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 104
LDI r2, 55
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (51, 21).
; PLAN: r0=51(x), r1=21(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 21
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
