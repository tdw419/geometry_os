; DESCRIPTION: Draws a cyan line from (415, 80) to (221, 137).
; PLAN: r0=415(x1), r1=80(y1), r2=221(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 80
LDI r2, 221
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
