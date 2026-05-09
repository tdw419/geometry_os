; DESCRIPTION: Draws a white line from (272, 138) to (337, 173).
; PLAN: r0=272(x1), r1=138(y1), r2=337(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 138
LDI r2, 337
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
