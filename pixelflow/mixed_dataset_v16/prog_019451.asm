; DESCRIPTION: Places a magenta line segment connecting (218, 230) to (275, 29).
; PLAN: r0=218(x1), r1=230(y1), r2=275(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 230
LDI r2, 275
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
