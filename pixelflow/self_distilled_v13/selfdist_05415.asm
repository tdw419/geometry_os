; DESCRIPTION: Draws a yellow line from (293, 154) to (205, 125).
; PLAN: r0=293(x1), r1=154(y1), r2=205(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 154
LDI r2, 205
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
