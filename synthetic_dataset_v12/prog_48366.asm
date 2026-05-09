; DESCRIPTION: Draws a magenta line from (328, 64) to (295, 73).
; PLAN: r0=328(x1), r1=64(y1), r2=295(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 64
LDI r2, 295
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
