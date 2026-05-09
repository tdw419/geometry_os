; DESCRIPTION: Composite: . Then Places a white dot at position (43, 15). Then Creates a purple rectangular region at (64, 41) spanning 91 by 104 pixels.
; PLAN: r0=43(x), r1=15(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=64(x), r1=41(y), r2=91(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (43, 15).
; PLAN: r0=43(x), r1=15(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 15
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a purple rectangular region at (64, 41) spanning 91 by 104 pixels.
; PLAN: r0=64(x), r1=41(y), r2=91(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 41
LDI r2, 91
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
