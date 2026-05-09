; DESCRIPTION: Places a red line segment connecting (433, 35) to (356, 154).
; PLAN: r0=433(x1), r1=35(y1), r2=356(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 35
LDI r2, 356
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
