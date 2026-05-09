; DESCRIPTION: Draws a cyan line from (445, 156) to (180, 207).
; PLAN: r0=445(x1), r1=156(y1), r2=180(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 156
LDI r2, 180
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
