; DESCRIPTION: Draws a magenta line from (380, 64) to (465, 195).
; PLAN: r0=380(x1), r1=64(y1), r2=465(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 64
LDI r2, 465
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
