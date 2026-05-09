; DESCRIPTION: Places a cyan line segment connecting (179, 198) to (12, 42).
; PLAN: r0=179(x1), r1=198(y1), r2=12(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 198
LDI r2, 12
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
