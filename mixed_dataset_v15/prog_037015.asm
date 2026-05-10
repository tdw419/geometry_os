; DESCRIPTION: Draws a cyan line from (80, 125) to (340, 13).
; PLAN: r0=80(x1), r1=125(y1), r2=340(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 125
LDI r2, 340
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
