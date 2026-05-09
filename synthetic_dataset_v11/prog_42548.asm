; DESCRIPTION: Places a cyan line segment connecting (206, 207) to (150, 72).
; PLAN: r0=206(x1), r1=207(y1), r2=150(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 207
LDI r2, 150
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
