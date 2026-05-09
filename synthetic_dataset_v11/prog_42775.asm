; DESCRIPTION: Places a magenta line segment connecting (146, 157) to (231, 38).
; PLAN: r0=146(x1), r1=157(y1), r2=231(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 157
LDI r2, 231
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
