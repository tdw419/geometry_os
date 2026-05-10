; DESCRIPTION: Draws a cyan line from (106, 95) to (450, 0).
; PLAN: r0=106(x1), r1=95(y1), r2=450(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 95
LDI r2, 450
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
