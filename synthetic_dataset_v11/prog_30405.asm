; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (122, 198). Then Renders a white box of size 117x68 starting at (40, 183).
; PLAN: r0=122(x), r1=198(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=40(x), r1=183(y), r2=117(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (122, 198).
; PLAN: r0=122(x), r1=198(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 198
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 117x68 starting at (40, 183).
; PLAN: r0=40(x), r1=183(y), r2=117(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 183
LDI r2, 117
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
