; DESCRIPTION: Draws a black line from (442, 87) to (228, 114).
; PLAN: r0=442(x1), r1=87(y1), r2=228(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 87
LDI r2, 228
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
