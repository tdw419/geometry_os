; DESCRIPTION: Draws a red line from (354, 228) to (452, 101).
; PLAN: r0=354(x1), r1=228(y1), r2=452(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 228
LDI r2, 452
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
