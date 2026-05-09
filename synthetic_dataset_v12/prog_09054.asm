; DESCRIPTION: Places a cyan line segment connecting (373, 90) to (120, 51).
; PLAN: r0=373(x1), r1=90(y1), r2=120(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 90
LDI r2, 120
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
