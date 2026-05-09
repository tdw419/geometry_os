; DESCRIPTION: Draws a cyan line from (144, 50) to (63, 194).
; PLAN: r0=144(x1), r1=50(y1), r2=63(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 50
LDI r2, 63
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
