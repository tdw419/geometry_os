; DESCRIPTION: Renders a yellow line between points (492, 30) and (291, 228).
; PLAN: r0=492(x1), r1=30(y1), r2=291(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 30
LDI r2, 291
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
