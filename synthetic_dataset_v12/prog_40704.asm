; DESCRIPTION: Draws a cyan line from (37, 54) to (280, 98).
; PLAN: r0=37(x1), r1=54(y1), r2=280(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 54
LDI r2, 280
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
