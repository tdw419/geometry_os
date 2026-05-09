; DESCRIPTION: Draws a white line from (123, 127) to (2, 210).
; PLAN: r0=123(x1), r1=127(y1), r2=2(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 127
LDI r2, 2
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
