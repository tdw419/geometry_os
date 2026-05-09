; DESCRIPTION: Draws a cyan line from (113, 245) to (79, 106).
; PLAN: r0=113(x1), r1=245(y1), r2=79(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 245
LDI r2, 79
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
