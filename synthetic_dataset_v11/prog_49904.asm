; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (183, 161). Then Renders a orange box of size 47x100 starting at (113, 139).
; PLAN: r0=183(x), r1=161(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=113(x), r1=139(y), r2=47(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (183, 161).
; PLAN: r0=183(x), r1=161(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 161
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 47x100 starting at (113, 139).
; PLAN: r0=113(x), r1=139(y), r2=47(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 139
LDI r2, 47
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
