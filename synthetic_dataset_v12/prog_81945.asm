; DESCRIPTION: Draws a red line from (417, 182) to (455, 228).
; PLAN: r0=417(x1), r1=182(y1), r2=455(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 182
LDI r2, 455
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
