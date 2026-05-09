; DESCRIPTION: Places a cyan line segment connecting (57, 180) to (393, 192).
; PLAN: r0=57(x1), r1=180(y1), r2=393(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 180
LDI r2, 393
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
