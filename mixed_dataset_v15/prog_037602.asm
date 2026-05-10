; DESCRIPTION: Draws a yellow line from (276, 133) to (308, 228).
; PLAN: r0=276(x1), r1=133(y1), r2=308(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 133
LDI r2, 308
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
