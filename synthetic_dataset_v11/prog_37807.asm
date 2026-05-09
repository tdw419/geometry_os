; DESCRIPTION: Draws a cyan line from (79, 148) to (135, 35).
; PLAN: r0=79(x1), r1=148(y1), r2=135(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 148
LDI r2, 135
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
