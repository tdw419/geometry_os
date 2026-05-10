; DESCRIPTION: Draws a cyan line from (184, 108) to (104, 10).
; PLAN: r0=184(x1), r1=108(y1), r2=104(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 108
LDI r2, 104
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
