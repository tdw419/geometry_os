; DESCRIPTION: Places a cyan line segment connecting (237, 87) to (111, 177).
; PLAN: r0=237(x1), r1=87(y1), r2=111(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 87
LDI r2, 111
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
