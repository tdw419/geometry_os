; DESCRIPTION: Draws a cyan line from (144, 49) to (3, 126).
; PLAN: r0=144(x1), r1=49(y1), r2=3(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 49
LDI r2, 3
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
