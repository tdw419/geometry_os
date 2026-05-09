; DESCRIPTION: Renders a cyan line between points (211, 149) and (69, 154).
; PLAN: r0=211(x1), r1=149(y1), r2=69(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 149
LDI r2, 69
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
