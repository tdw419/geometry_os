; DESCRIPTION: Draws a yellow line from (510, 249) to (486, 228).
; PLAN: r0=510(x1), r1=249(y1), r2=486(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 249
LDI r2, 486
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
