; DESCRIPTION: Places a cyan line segment connecting (463, 146) to (439, 82).
; PLAN: r0=463(x1), r1=146(y1), r2=439(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 146
LDI r2, 439
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
