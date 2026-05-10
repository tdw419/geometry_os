; DESCRIPTION: Draws a cyan line from (243, 167) to (201, 64).
; PLAN: r0=243(x1), r1=167(y1), r2=201(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 167
LDI r2, 201
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
