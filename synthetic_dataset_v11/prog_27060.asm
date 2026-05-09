; DESCRIPTION: Draws a green line from (175, 124) to (63, 83).
; PLAN: r0=175(x1), r1=124(y1), r2=63(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 124
LDI r2, 63
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
