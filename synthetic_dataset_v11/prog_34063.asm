; DESCRIPTION: Draws a cyan line from (184, 2) to (29, 208).
; PLAN: r0=184(x1), r1=2(y1), r2=29(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 2
LDI r2, 29
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
