; DESCRIPTION: Draws a cyan line from (84, 133) to (71, 134).
; PLAN: r0=84(x1), r1=133(y1), r2=71(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 133
LDI r2, 71
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
