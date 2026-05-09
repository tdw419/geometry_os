; DESCRIPTION: Places a cyan line segment connecting (237, 179) to (174, 243).
; PLAN: r0=237(x1), r1=179(y1), r2=174(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 179
LDI r2, 174
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
