; DESCRIPTION: Draws a cyan line from (127, 20) to (270, 60).
; PLAN: r0=127(x1), r1=20(y1), r2=270(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 20
LDI r2, 270
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
