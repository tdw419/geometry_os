; DESCRIPTION: Places a cyan line segment connecting (135, 119) to (189, 154).
; PLAN: r0=135(x1), r1=119(y1), r2=189(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 119
LDI r2, 189
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
