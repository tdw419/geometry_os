; DESCRIPTION: Renders a cyan line between points (189, 138) and (46, 154).
; PLAN: r0=189(x1), r1=138(y1), r2=46(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 138
LDI r2, 46
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
