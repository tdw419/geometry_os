; DESCRIPTION: Draws a white line from (371, 229) to (125, 242).
; PLAN: r0=371(x1), r1=229(y1), r2=125(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 229
LDI r2, 125
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
