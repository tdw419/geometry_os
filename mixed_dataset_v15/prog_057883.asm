; DESCRIPTION: Draws a white line from (243, 52) to (275, 13).
; PLAN: r0=243(x1), r1=52(y1), r2=275(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 52
LDI r2, 275
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
