; DESCRIPTION: Places a cyan line segment connecting (80, 33) to (434, 235).
; PLAN: r0=80(x1), r1=33(y1), r2=434(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 33
LDI r2, 434
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
