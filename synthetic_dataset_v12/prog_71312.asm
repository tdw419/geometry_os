; DESCRIPTION: Draws a black line from (228, 134) to (95, 59).
; PLAN: r0=228(x1), r1=134(y1), r2=95(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 134
LDI r2, 95
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
