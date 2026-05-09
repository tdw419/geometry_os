; DESCRIPTION: Places a cyan line segment connecting (81, 151) to (197, 137).
; PLAN: r0=81(x1), r1=151(y1), r2=197(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 151
LDI r2, 197
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
