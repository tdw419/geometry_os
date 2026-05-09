; DESCRIPTION: Draws a cyan line from (473, 64) to (44, 161).
; PLAN: r0=473(x1), r1=64(y1), r2=44(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 64
LDI r2, 44
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
