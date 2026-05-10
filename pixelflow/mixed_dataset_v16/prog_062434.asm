; DESCRIPTION: Draws a white line from (460, 243) to (63, 210).
; PLAN: r0=460(x1), r1=243(y1), r2=63(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 243
LDI r2, 63
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
