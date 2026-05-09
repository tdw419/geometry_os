; DESCRIPTION: Draws a black line from (502, 121) to (275, 132).
; PLAN: r0=502(x1), r1=121(y1), r2=275(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 121
LDI r2, 275
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
