; DESCRIPTION: Places a cyan line segment connecting (206, 74) to (7, 18).
; PLAN: r0=206(x1), r1=74(y1), r2=7(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 74
LDI r2, 7
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
