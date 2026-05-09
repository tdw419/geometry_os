; DESCRIPTION: Draws a cyan line from (50, 234) to (138, 106).
; PLAN: r0=50(x1), r1=234(y1), r2=138(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 234
LDI r2, 138
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
