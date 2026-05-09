; DESCRIPTION: Composite: . Then Places a white dot at position (21, 178). Then Creates a purple rectangular region at (42, 41) spanning 89 by 36 pixels.
; PLAN: r0=21(x), r1=178(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=42(x), r1=41(y), r2=89(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (21, 178).
; PLAN: r0=21(x), r1=178(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 178
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a purple rectangular region at (42, 41) spanning 89 by 36 pixels.
; PLAN: r0=42(x), r1=41(y), r2=89(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 41
LDI r2, 89
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
