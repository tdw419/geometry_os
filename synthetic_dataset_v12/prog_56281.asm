; DESCRIPTION: Draws a black line from (504, 203) to (117, 228).
; PLAN: r0=504(x1), r1=203(y1), r2=117(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 203
LDI r2, 117
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
