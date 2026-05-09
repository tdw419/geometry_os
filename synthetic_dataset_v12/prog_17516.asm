; DESCRIPTION: Places a cyan line segment connecting (481, 120) to (177, 75).
; PLAN: r0=481(x1), r1=120(y1), r2=177(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 120
LDI r2, 177
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
