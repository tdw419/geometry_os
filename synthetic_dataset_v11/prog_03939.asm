; DESCRIPTION: Draws a cyan line from (231, 64) to (206, 116).
; PLAN: r0=231(x1), r1=64(y1), r2=206(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 64
LDI r2, 206
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
