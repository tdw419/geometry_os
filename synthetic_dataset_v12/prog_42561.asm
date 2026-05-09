; DESCRIPTION: Renders a cyan line between points (320, 114) and (20, 154).
; PLAN: r0=320(x1), r1=114(y1), r2=20(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 114
LDI r2, 20
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
