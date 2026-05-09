; DESCRIPTION: Draws a cyan line from (276, 176) to (26, 14).
; PLAN: r0=276(x1), r1=176(y1), r2=26(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 176
LDI r2, 26
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
