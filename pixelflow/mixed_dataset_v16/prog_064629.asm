; DESCRIPTION: Places a magenta line segment connecting (202, 174) to (16, 178).
; PLAN: r0=202(x1), r1=174(y1), r2=16(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 174
LDI r2, 16
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
