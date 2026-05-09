; DESCRIPTION: Draws a cyan line from (93, 65) to (440, 7).
; PLAN: r0=93(x1), r1=65(y1), r2=440(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 65
LDI r2, 440
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
