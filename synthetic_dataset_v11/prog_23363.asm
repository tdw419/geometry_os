; DESCRIPTION: Composite: . Then Places a green dot at position (25, 40). Then Places a magenta line segment connecting (167, 7) to (127, 10).
; PLAN: r0=25(x), r1=40(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=167(x1), r1=7(y1), r2=127(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (25, 40).
; PLAN: r0=25(x), r1=40(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 40
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a magenta line segment connecting (167, 7) to (127, 10).
; PLAN: r0=167(x1), r1=7(y1), r2=127(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 7
LDI r2, 127
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
