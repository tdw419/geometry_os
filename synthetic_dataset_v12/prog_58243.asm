; DESCRIPTION: Draws a cyan line from (79, 142) to (72, 19).
; PLAN: r0=79(x1), r1=142(y1), r2=72(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 142
LDI r2, 72
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
