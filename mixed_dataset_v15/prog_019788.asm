; DESCRIPTION: Draws a magenta line from (115, 71) to (284, 95).
; PLAN: r0=115(x1), r1=71(y1), r2=284(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 71
LDI r2, 284
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
