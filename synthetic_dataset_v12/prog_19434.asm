; DESCRIPTION: Draws a cyan line from (145, 150) to (469, 125).
; PLAN: r0=145(x1), r1=150(y1), r2=469(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 150
LDI r2, 469
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
