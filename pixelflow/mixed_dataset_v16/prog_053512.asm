; DESCRIPTION: Draws a white line from (218, 59) to (29, 207).
; PLAN: r0=218(x1), r1=59(y1), r2=29(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 59
LDI r2, 29
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
