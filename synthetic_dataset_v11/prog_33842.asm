; DESCRIPTION: Draws a cyan line from (229, 37) to (144, 87).
; PLAN: r0=229(x1), r1=37(y1), r2=144(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 37
LDI r2, 144
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
