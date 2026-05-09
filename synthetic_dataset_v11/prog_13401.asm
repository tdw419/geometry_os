; DESCRIPTION: Draws a green line from (131, 228) to (37, 106).
; PLAN: r0=131(x1), r1=228(y1), r2=37(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 228
LDI r2, 37
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
