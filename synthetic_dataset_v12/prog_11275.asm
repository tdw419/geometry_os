; DESCRIPTION: Places a magenta line segment connecting (398, 234) to (322, 43).
; PLAN: r0=398(x1), r1=234(y1), r2=322(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 234
LDI r2, 322
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
