; DESCRIPTION: Draws a yellow line from (502, 31) to (324, 52).
; PLAN: r0=502(x1), r1=31(y1), r2=324(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 31
LDI r2, 324
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
