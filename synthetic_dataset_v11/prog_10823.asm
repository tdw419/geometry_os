; DESCRIPTION: Draws a cyan line from (128, 2) to (68, 154).
; PLAN: r0=128(x1), r1=2(y1), r2=68(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 2
LDI r2, 68
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
