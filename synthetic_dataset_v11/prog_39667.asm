; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (125, 49) spanning 75 by 84 pixels. Then Places a yellow dot at position (104, 138).
; PLAN: r0=125(x), r1=49(y), r2=75(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=104(x), r1=138(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow rectangular region at (125, 49) spanning 75 by 84 pixels.
; PLAN: r0=125(x), r1=49(y), r2=75(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 49
LDI r2, 75
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (104, 138).
; PLAN: r0=104(x), r1=138(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 138
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
