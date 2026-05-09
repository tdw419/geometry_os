; DESCRIPTION: Draws a white line from (243, 199) to (138, 210).
; PLAN: r0=243(x1), r1=199(y1), r2=138(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 199
LDI r2, 138
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
