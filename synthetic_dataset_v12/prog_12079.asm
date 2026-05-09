; DESCRIPTION: Places a cyan line segment connecting (135, 231) to (17, 16).
; PLAN: r0=135(x1), r1=231(y1), r2=17(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 231
LDI r2, 17
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
