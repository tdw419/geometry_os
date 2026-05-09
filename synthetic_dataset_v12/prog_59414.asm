; DESCRIPTION: Draws a cyan line from (83, 54) to (12, 120).
; PLAN: r0=83(x1), r1=54(y1), r2=12(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 54
LDI r2, 12
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
