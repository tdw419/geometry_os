; DESCRIPTION: Draws a green line from (4, 228) to (62, 43).
; PLAN: r0=4(x1), r1=228(y1), r2=62(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 228
LDI r2, 62
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
