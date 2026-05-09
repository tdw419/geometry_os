; DESCRIPTION: Draws a cyan line from (3, 149) to (52, 59).
; PLAN: r0=3(x1), r1=149(y1), r2=52(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 149
LDI r2, 52
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
