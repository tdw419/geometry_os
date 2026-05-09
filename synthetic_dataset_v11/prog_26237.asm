; DESCRIPTION: Draws a cyan line from (154, 22) to (64, 114).
; PLAN: r0=154(x1), r1=22(y1), r2=64(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 22
LDI r2, 64
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
