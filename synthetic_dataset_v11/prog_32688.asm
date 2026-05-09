; DESCRIPTION: Draws a cyan line from (96, 38) to (115, 154).
; PLAN: r0=96(x1), r1=38(y1), r2=115(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 38
LDI r2, 115
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
