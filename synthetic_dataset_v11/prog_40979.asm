; DESCRIPTION: Composite: . Then Places a red dot at position (111, 81). Then Renders a orange box of size 12x110 starting at (177, 91).
; PLAN: r0=111(x), r1=81(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=177(x), r1=91(y), r2=12(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (111, 81).
; PLAN: r0=111(x), r1=81(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 81
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 12x110 starting at (177, 91).
; PLAN: r0=177(x), r1=91(y), r2=12(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 91
LDI r2, 12
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
