; DESCRIPTION: Draws a white line from (284, 26) to (183, 81).
; PLAN: r0=284(x1), r1=26(y1), r2=183(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 26
LDI r2, 183
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
