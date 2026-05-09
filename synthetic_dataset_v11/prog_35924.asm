; DESCRIPTION: Places a white line segment connecting (151, 63) to (82, 132).
; PLAN: r0=151(x1), r1=63(y1), r2=82(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 63
LDI r2, 82
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
