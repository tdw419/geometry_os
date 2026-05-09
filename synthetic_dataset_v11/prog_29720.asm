; DESCRIPTION: Draws a cyan line from (113, 179) to (48, 65).
; PLAN: r0=113(x1), r1=179(y1), r2=48(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 179
LDI r2, 48
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
