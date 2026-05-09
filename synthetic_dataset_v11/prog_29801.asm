; DESCRIPTION: Places a green line segment connecting (187, 132) to (87, 42).
; PLAN: r0=187(x1), r1=132(y1), r2=87(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 132
LDI r2, 87
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
