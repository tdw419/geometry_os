; DESCRIPTION: Composite: . Then Places a magenta dot at position (114, 135). Then Renders a magenta line between points (247, 130) and (255, 185).
; PLAN: r0=114(x), r1=135(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=247(x1), r1=130(y1), r2=255(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (114, 135).
; PLAN: r0=114(x), r1=135(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 135
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta line between points (247, 130) and (255, 185).
; PLAN: r0=247(x1), r1=130(y1), r2=255(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 130
LDI r2, 255
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
