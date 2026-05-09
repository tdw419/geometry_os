; DESCRIPTION: Places a green line segment connecting (220, 50) to (171, 186).
; PLAN: r0=220(x1), r1=50(y1), r2=171(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 50
LDI r2, 171
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
