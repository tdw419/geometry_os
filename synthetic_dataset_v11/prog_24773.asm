; DESCRIPTION: Composite: . Then Places a magenta dot at position (17, 198). Then Renders a orange line between points (238, 88) and (113, 242).
; PLAN: r0=17(x), r1=198(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=238(x1), r1=88(y1), r2=113(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (17, 198).
; PLAN: r0=17(x), r1=198(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 198
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange line between points (238, 88) and (113, 242).
; PLAN: r0=238(x1), r1=88(y1), r2=113(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 88
LDI r2, 113
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
