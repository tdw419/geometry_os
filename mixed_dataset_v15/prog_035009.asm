; DESCRIPTION: Draws a cyan line from (283, 120) to (466, 152).
; PLAN: r0=283(x1), r1=120(y1), r2=466(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 120
LDI r2, 466
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
