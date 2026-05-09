; DESCRIPTION: Draws a magenta line from (10, 126) to (173, 170).
; PLAN: r0=10(x1), r1=126(y1), r2=173(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 126
LDI r2, 173
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
