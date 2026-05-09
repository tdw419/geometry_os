; DESCRIPTION: Draws a purple line from (91, 42) to (126, 7).
; PLAN: r0=91(x1), r1=42(y1), r2=126(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 42
LDI r2, 126
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
