; DESCRIPTION: Composite: . Then Sets a single red pixel at (162, 177). Then Renders a orange box of size 108x12 starting at (71, 228).
; PLAN: r0=162(x), r1=177(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=71(x), r1=228(y), r2=108(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (162, 177).
; PLAN: r0=162(x), r1=177(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 177
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 108x12 starting at (71, 228).
; PLAN: r0=71(x), r1=228(y), r2=108(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 228
LDI r2, 108
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
