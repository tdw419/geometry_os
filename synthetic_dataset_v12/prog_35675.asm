; DESCRIPTION: Draws a red line from (286, 67) to (0, 228).
; PLAN: r0=286(x1), r1=67(y1), r2=0(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 67
LDI r2, 0
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
