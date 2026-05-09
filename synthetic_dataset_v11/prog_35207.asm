; DESCRIPTION: Places a black line segment connecting (206, 195) to (27, 82).
; PLAN: r0=206(x1), r1=195(y1), r2=27(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 195
LDI r2, 27
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
