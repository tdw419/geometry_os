; DESCRIPTION: Places a cyan line segment connecting (204, 162) to (202, 236).
; PLAN: r0=204(x1), r1=162(y1), r2=202(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 162
LDI r2, 202
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
