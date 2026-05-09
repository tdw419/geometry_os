; DESCRIPTION: Draws a cyan line from (206, 65) to (55, 71).
; PLAN: r0=206(x1), r1=65(y1), r2=55(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 65
LDI r2, 55
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
