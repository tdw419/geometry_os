; DESCRIPTION: Places a cyan line segment connecting (235, 124) to (68, 75).
; PLAN: r0=235(x1), r1=124(y1), r2=68(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 124
LDI r2, 68
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
