; DESCRIPTION: Draws a cyan line from (431, 16) to (247, 203).
; PLAN: r0=431(x1), r1=16(y1), r2=247(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 16
LDI r2, 247
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
