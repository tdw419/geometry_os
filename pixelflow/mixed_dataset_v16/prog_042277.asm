; DESCRIPTION: Draws a cyan line from (162, 33) to (106, 172).
; PLAN: r0=162(x1), r1=33(y1), r2=106(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 33
LDI r2, 106
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
