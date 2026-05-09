; DESCRIPTION: Draws a green line from (191, 125) to (171, 203).
; PLAN: r0=191(x1), r1=125(y1), r2=171(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 125
LDI r2, 171
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
