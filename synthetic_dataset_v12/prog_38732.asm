; DESCRIPTION: Draws a cyan line from (98, 62) to (440, 35).
; PLAN: r0=98(x1), r1=62(y1), r2=440(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 62
LDI r2, 440
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
