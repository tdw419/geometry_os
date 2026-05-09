; DESCRIPTION: Draws a magenta line from (57, 238) to (327, 128).
; PLAN: r0=57(x1), r1=238(y1), r2=327(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 238
LDI r2, 327
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
