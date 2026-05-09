; DESCRIPTION: Draws a cyan line from (63, 210) to (90, 85).
; PLAN: r0=63(x1), r1=210(y1), r2=90(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 210
LDI r2, 90
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
