; DESCRIPTION: Places a black line segment connecting (365, 202) to (82, 134).
; PLAN: r0=365(x1), r1=202(y1), r2=82(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 202
LDI r2, 82
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
