; DESCRIPTION: Places a red line segment connecting (213, 212) to (267, 221).
; PLAN: r0=213(x1), r1=212(y1), r2=267(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 212
LDI r2, 267
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
