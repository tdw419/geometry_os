; DESCRIPTION: Draws a green line from (196, 78) to (243, 28).
; PLAN: r0=196(x1), r1=78(y1), r2=243(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 78
LDI r2, 243
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
