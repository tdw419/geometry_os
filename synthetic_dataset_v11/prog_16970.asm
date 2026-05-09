; DESCRIPTION: Draws a cyan line from (45, 36) to (184, 143).
; PLAN: r0=45(x1), r1=36(y1), r2=184(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 36
LDI r2, 184
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
