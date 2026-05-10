; DESCRIPTION: Draws a cyan line from (273, 20) to (362, 68).
; PLAN: r0=273(x1), r1=20(y1), r2=362(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 20
LDI r2, 362
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
