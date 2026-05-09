; DESCRIPTION: Composite: . Then Draws a purple circle centered at (74, 114) with radius 70. Then Places a green dot at position (252, 180).
; PLAN: r0=74(x), r1=114(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=252(x), r1=180(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (74, 114) with radius 70.
; PLAN: r0=74(x), r1=114(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 114
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (252, 180).
; PLAN: r0=252(x), r1=180(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 252
LDI r1, 180
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
