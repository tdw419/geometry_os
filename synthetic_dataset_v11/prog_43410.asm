; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (103, 189) to (215, 166). Then Places a green circle of radius 57 at center (74, 132).
; PLAN: r0=103(x1), r1=189(y1), r2=215(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=74(x), r1=132(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan line segment connecting (103, 189) to (215, 166).
; PLAN: r0=103(x1), r1=189(y1), r2=215(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 189
LDI r2, 215
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 57 at center (74, 132).
; PLAN: r0=74(x), r1=132(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 132
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
