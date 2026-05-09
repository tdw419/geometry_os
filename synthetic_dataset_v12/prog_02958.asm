; DESCRIPTION: Draws a cyan line from (407, 160) to (235, 196).
; PLAN: r0=407(x1), r1=160(y1), r2=235(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 160
LDI r2, 235
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
