; DESCRIPTION: Draws a cyan line from (266, 0) to (326, 64).
; PLAN: r0=266(x1), r1=0(y1), r2=326(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 0
LDI r2, 326
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
