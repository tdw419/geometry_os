; DESCRIPTION: Draws a cyan line from (154, 51) to (260, 205).
; PLAN: r0=154(x1), r1=51(y1), r2=260(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 51
LDI r2, 260
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
