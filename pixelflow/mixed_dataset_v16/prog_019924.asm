; DESCRIPTION: Places a cyan line segment connecting (143, 210) to (129, 177).
; PLAN: r0=143(x1), r1=210(y1), r2=129(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 210
LDI r2, 129
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
