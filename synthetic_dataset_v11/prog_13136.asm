; DESCRIPTION: Composite: . Then Creates a red rectangular region at (41, 91) spanning 101 by 57 pixels. Then Sets a single green pixel at (1, 153).
; PLAN: r0=41(x), r1=91(y), r2=101(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=1(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red rectangular region at (41, 91) spanning 101 by 57 pixels.
; PLAN: r0=41(x), r1=91(y), r2=101(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 91
LDI r2, 101
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (1, 153).
; PLAN: r0=1(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 153
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
