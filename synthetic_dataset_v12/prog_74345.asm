; DESCRIPTION: Places a white line segment connecting (393, 8) to (90, 154).
; PLAN: r0=393(x1), r1=8(y1), r2=90(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 8
LDI r2, 90
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
