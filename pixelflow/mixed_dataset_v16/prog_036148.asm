; DESCRIPTION: Places a cyan line segment connecting (180, 242) to (423, 144).
; PLAN: r0=180(x1), r1=242(y1), r2=423(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 242
LDI r2, 423
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
