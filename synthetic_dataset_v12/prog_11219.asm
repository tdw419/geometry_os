; DESCRIPTION: Places a cyan line segment connecting (307, 137) to (271, 237).
; PLAN: r0=307(x1), r1=137(y1), r2=271(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 137
LDI r2, 271
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
