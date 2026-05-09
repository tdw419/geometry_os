; DESCRIPTION: Draws a green line from (126, 90) to (45, 37).
; PLAN: r0=126(x1), r1=90(y1), r2=45(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 90
LDI r2, 45
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
