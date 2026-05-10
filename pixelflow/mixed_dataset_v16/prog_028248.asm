; DESCRIPTION: Places a orange line segment connecting (264, 113) to (168, 154).
; PLAN: r0=264(x1), r1=113(y1), r2=168(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 113
LDI r2, 168
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
