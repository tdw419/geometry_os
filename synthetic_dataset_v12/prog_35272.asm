; DESCRIPTION: Draws a blue line from (340, 177) to (450, 173).
; PLAN: r0=340(x1), r1=177(y1), r2=450(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 177
LDI r2, 450
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
