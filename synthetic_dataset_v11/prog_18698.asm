; DESCRIPTION: Draws a green line from (243, 189) to (0, 210).
; PLAN: r0=243(x1), r1=189(y1), r2=0(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 189
LDI r2, 0
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
