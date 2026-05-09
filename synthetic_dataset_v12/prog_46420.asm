; DESCRIPTION: Places a cyan line segment connecting (363, 7) to (413, 235).
; PLAN: r0=363(x1), r1=7(y1), r2=413(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 7
LDI r2, 413
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
