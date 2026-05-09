; DESCRIPTION: Draws a black line from (56, 228) to (228, 142).
; PLAN: r0=56(x1), r1=228(y1), r2=228(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 228
LDI r2, 228
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
