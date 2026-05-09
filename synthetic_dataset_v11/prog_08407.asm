; DESCRIPTION: Composite: . Then Places a white dot at position (19, 155). Then Creates a red rectangular region at (125, 39) spanning 15 by 119 pixels.
; PLAN: r0=19(x), r1=155(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=125(x), r1=39(y), r2=15(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (19, 155).
; PLAN: r0=19(x), r1=155(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 155
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a red rectangular region at (125, 39) spanning 15 by 119 pixels.
; PLAN: r0=125(x), r1=39(y), r2=15(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 39
LDI r2, 15
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
