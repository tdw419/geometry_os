; DESCRIPTION: Places a cyan line segment connecting (495, 233) to (502, 97).
; PLAN: r0=495(x1), r1=233(y1), r2=502(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 233
LDI r2, 502
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
