; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (132, 146). Then Draws a yellow line from (151, 53) to (239, 74).
; PLAN: r0=132(x), r1=146(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=151(x1), r1=53(y1), r2=239(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (132, 146).
; PLAN: r0=132(x), r1=146(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 146
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (151, 53) to (239, 74).
; PLAN: r0=151(x1), r1=53(y1), r2=239(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 53
LDI r2, 239
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
