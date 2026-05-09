; DESCRIPTION: Places a magenta line segment connecting (391, 27) to (487, 167).
; PLAN: r0=391(x1), r1=27(y1), r2=487(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 27
LDI r2, 487
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
