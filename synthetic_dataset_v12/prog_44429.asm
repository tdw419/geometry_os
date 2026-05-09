; DESCRIPTION: Draws a cyan line from (252, 156) to (168, 180).
; PLAN: r0=252(x1), r1=156(y1), r2=168(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 156
LDI r2, 168
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
