; DESCRIPTION: Draws a cyan line from (508, 70) to (75, 24).
; PLAN: r0=508(x1), r1=70(y1), r2=75(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 70
LDI r2, 75
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
