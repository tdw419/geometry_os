; DESCRIPTION: Places a magenta line segment connecting (236, 248) to (342, 174).
; PLAN: r0=236(x1), r1=248(y1), r2=342(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 248
LDI r2, 342
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
