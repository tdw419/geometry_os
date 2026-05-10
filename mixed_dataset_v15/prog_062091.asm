; DESCRIPTION: Places a cyan line segment connecting (417, 209) to (489, 150).
; PLAN: r0=417(x1), r1=209(y1), r2=489(x2), r3=150(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 209
LDI r2, 489
LDI r3, 150
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
