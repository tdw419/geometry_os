; DESCRIPTION: Places a cyan line segment connecting (370, 97) to (413, 120).
; PLAN: r0=370(x1), r1=97(y1), r2=413(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 97
LDI r2, 413
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
