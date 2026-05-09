; DESCRIPTION: Places a cyan line segment connecting (236, 254) to (69, 189).
; PLAN: r0=236(x1), r1=254(y1), r2=69(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 254
LDI r2, 69
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
