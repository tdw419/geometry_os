; DESCRIPTION: Draws a green line from (138, 197) to (217, 152).
; PLAN: r0=138(x1), r1=197(y1), r2=217(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 197
LDI r2, 217
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
