; DESCRIPTION: Renders a cyan line between points (150, 97) and (448, 67).
; PLAN: r0=150(x1), r1=97(y1), r2=448(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 97
LDI r2, 448
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
