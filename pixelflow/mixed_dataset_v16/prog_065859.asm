; DESCRIPTION: Draws a white line from (460, 203) to (156, 23).
; PLAN: r0=460(x1), r1=203(y1), r2=156(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 203
LDI r2, 156
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
