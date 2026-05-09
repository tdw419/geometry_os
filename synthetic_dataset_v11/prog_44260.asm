; DESCRIPTION: Places a cyan line segment connecting (87, 25) to (145, 242).
; PLAN: r0=87(x1), r1=25(y1), r2=145(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 25
LDI r2, 145
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
