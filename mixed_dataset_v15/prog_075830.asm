; DESCRIPTION: Places a red line segment connecting (380, 119) to (171, 154).
; PLAN: r0=380(x1), r1=119(y1), r2=171(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 119
LDI r2, 171
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
