; DESCRIPTION: Draws a green line from (25, 31) to (171, 152).
; PLAN: r0=25(x1), r1=31(y1), r2=171(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 31
LDI r2, 171
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
