; DESCRIPTION: Renders a orange line between points (168, 188) and (239, 154).
; PLAN: r0=168(x1), r1=188(y1), r2=239(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 188
LDI r2, 239
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
