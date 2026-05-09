; DESCRIPTION: Places a green line segment connecting (82, 48) to (195, 209).
; PLAN: r0=82(x1), r1=48(y1), r2=195(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 48
LDI r2, 195
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
