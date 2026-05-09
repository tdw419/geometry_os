; DESCRIPTION: Places a magenta line segment connecting (27, 7) to (47, 213).
; PLAN: r0=27(x1), r1=7(y1), r2=47(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 7
LDI r2, 47
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
