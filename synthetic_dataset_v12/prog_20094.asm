; DESCRIPTION: Places a cyan line segment connecting (150, 208) to (414, 194).
; PLAN: r0=150(x1), r1=208(y1), r2=414(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 208
LDI r2, 414
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
