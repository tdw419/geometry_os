; DESCRIPTION: Draws a white line from (283, 33) to (271, 44).
; PLAN: r0=283(x1), r1=33(y1), r2=271(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 33
LDI r2, 271
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
