; DESCRIPTION: Places a green line segment connecting (206, 42) to (150, 250).
; PLAN: r0=206(x1), r1=42(y1), r2=150(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 42
LDI r2, 150
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
