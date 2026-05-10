; DESCRIPTION: Draws a cyan line from (353, 120) to (424, 5).
; PLAN: r0=353(x1), r1=120(y1), r2=424(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 120
LDI r2, 424
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
