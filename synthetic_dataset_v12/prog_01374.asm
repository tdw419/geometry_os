; DESCRIPTION: Places a cyan line segment connecting (360, 146) to (351, 223).
; PLAN: r0=360(x1), r1=146(y1), r2=351(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 146
LDI r2, 351
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
