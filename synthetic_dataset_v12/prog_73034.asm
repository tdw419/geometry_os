; DESCRIPTION: Draws a white line from (130, 183) to (487, 128).
; PLAN: r0=130(x1), r1=183(y1), r2=487(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 183
LDI r2, 487
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
