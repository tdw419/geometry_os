; DESCRIPTION: Draws a cyan line from (78, 12) to (29, 236).
; PLAN: r0=78(x1), r1=12(y1), r2=29(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 12
LDI r2, 29
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
