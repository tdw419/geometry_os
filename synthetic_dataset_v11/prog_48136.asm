; DESCRIPTION: Places a cyan line segment connecting (207, 178) to (207, 8).
; PLAN: r0=207(x1), r1=178(y1), r2=207(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 178
LDI r2, 207
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
