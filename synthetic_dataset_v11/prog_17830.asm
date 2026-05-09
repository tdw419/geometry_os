; DESCRIPTION: Draws a white line from (229, 59) to (11, 113).
; PLAN: r0=229(x1), r1=59(y1), r2=11(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 59
LDI r2, 11
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
