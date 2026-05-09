; DESCRIPTION: Draws a cyan line from (75, 195) to (135, 10).
; PLAN: r0=75(x1), r1=195(y1), r2=135(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 195
LDI r2, 135
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
