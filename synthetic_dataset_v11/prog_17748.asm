; DESCRIPTION: Draws a blue line from (87, 196) to (218, 44).
; PLAN: r0=87(x1), r1=196(y1), r2=218(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 196
LDI r2, 218
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
