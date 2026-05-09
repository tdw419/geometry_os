; DESCRIPTION: Draws a cyan line from (121, 137) to (175, 42).
; PLAN: r0=121(x1), r1=137(y1), r2=175(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 137
LDI r2, 175
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
