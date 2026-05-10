; DESCRIPTION: Draws a cyan line from (15, 129) to (126, 205).
; PLAN: r0=15(x1), r1=129(y1), r2=126(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 129
LDI r2, 126
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
