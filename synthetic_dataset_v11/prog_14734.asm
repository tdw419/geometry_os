; DESCRIPTION: Composite: . Then Sets a single white pixel at (74, 113). Then Renders a magenta line between points (229, 132) and (72, 208).
; PLAN: r0=74(x), r1=113(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=229(x1), r1=132(y1), r2=72(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (74, 113).
; PLAN: r0=74(x), r1=113(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 113
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta line between points (229, 132) and (72, 208).
; PLAN: r0=229(x1), r1=132(y1), r2=72(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 132
LDI r2, 72
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
