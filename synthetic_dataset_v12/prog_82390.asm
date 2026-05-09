; DESCRIPTION: Draws a cyan line from (274, 119) to (32, 214).
; PLAN: r0=274(x1), r1=119(y1), r2=32(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 119
LDI r2, 32
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
