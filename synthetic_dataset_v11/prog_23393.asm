; DESCRIPTION: Places a cyan line segment connecting (4, 146) to (186, 56).
; PLAN: r0=4(x1), r1=146(y1), r2=186(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 146
LDI r2, 186
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
