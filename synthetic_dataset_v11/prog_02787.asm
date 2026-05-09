; DESCRIPTION: Draws a cyan line from (64, 117) to (110, 154).
; PLAN: r0=64(x1), r1=117(y1), r2=110(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 117
LDI r2, 110
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
