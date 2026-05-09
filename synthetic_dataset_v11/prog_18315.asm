; DESCRIPTION: Composite: . Then Renders a yellow box of size 68x91 starting at (183, 70). Then Sets a single green pixel at (238, 200).
; PLAN: r0=183(x), r1=70(y), r2=68(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=238(x), r1=200(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow box of size 68x91 starting at (183, 70).
; PLAN: r0=183(x), r1=70(y), r2=68(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 70
LDI r2, 68
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (238, 200).
; PLAN: r0=238(x), r1=200(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 200
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
