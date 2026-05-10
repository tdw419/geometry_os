; DESCRIPTION: Draws a cyan line from (24, 74) to (326, 92).
; PLAN: r0=24(x1), r1=74(y1), r2=326(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 74
LDI r2, 326
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
