; DESCRIPTION: Draws a cyan line from (79, 181) to (280, 252).
; PLAN: r0=79(x1), r1=181(y1), r2=280(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 181
LDI r2, 280
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
