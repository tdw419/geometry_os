; DESCRIPTION: Draws a black line from (228, 205) to (341, 167).
; PLAN: r0=228(x1), r1=205(y1), r2=341(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 205
LDI r2, 341
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
