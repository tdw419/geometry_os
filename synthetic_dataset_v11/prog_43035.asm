; DESCRIPTION: Composite: . Then Draws a red circle centered at (187, 208) with radius 26. Then Places a magenta dot at position (121, 80).
; PLAN: r0=187(x), r1=208(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=121(x), r1=80(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red circle centered at (187, 208) with radius 26.
; PLAN: r0=187(x), r1=208(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 208
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (121, 80).
; PLAN: r0=121(x), r1=80(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 121
LDI r1, 80
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
