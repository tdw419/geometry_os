; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (74, 53) spanning 72 by 19 pixels. Then Places a orange dot at position (217, 125).
; PLAN: r0=74(x), r1=53(y), r2=72(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=217(x), r1=125(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a purple rectangular region at (74, 53) spanning 72 by 19 pixels.
; PLAN: r0=74(x), r1=53(y), r2=72(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 53
LDI r2, 72
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (217, 125).
; PLAN: r0=217(x), r1=125(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 125
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
