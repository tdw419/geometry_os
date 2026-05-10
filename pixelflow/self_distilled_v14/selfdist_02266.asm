; DESCRIPTION: Draws a cyan line from (169, 196) to (394, 154).
; PLAN: r0=169(x1), r1=196(y1), r2=394(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 196
LDI r2, 394
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
