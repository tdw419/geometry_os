; DESCRIPTION: Draws a cyan line from (191, 5) to (84, 202).
; PLAN: r0=191(x1), r1=5(y1), r2=84(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 5
LDI r2, 84
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
