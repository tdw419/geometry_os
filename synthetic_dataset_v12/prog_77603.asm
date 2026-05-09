; DESCRIPTION: Places a magenta line segment connecting (340, 134) to (157, 190).
; PLAN: r0=340(x1), r1=134(y1), r2=157(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 134
LDI r2, 157
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
