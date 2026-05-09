; DESCRIPTION: Places a cyan line segment connecting (207, 150) to (144, 37).
; PLAN: r0=207(x1), r1=150(y1), r2=144(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 150
LDI r2, 144
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
