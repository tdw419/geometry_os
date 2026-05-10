; DESCRIPTION: Draws a black line from (119, 98) to (166, 228).
; PLAN: r0=119(x1), r1=98(y1), r2=166(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 98
LDI r2, 166
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
