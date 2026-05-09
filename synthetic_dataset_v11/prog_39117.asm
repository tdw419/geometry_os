; DESCRIPTION: Composite: . Then Draws a orange circle centered at (79, 167) with radius 29. Then Places a red dot at position (187, 225).
; PLAN: r0=79(x), r1=167(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=187(x), r1=225(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange circle centered at (79, 167) with radius 29.
; PLAN: r0=79(x), r1=167(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 167
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (187, 225).
; PLAN: r0=187(x), r1=225(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 225
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
