; DESCRIPTION: Places a green line segment connecting (115, 42) to (127, 231).
; PLAN: r0=115(x1), r1=42(y1), r2=127(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 42
LDI r2, 127
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
