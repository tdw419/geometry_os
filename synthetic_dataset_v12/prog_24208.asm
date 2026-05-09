; DESCRIPTION: Draws a cyan line from (175, 111) to (462, 80).
; PLAN: r0=175(x1), r1=111(y1), r2=462(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 111
LDI r2, 462
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
