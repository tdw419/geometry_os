; DESCRIPTION: Composite: . Then Places a white dot at position (60, 238). Then Creates a white rectangular region at (24, 41) spanning 34 by 119 pixels.
; PLAN: r0=60(x), r1=238(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=24(x), r1=41(y), r2=34(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (60, 238).
; PLAN: r0=60(x), r1=238(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 238
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a white rectangular region at (24, 41) spanning 34 by 119 pixels.
; PLAN: r0=24(x), r1=41(y), r2=34(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 41
LDI r2, 34
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
