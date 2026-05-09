; DESCRIPTION: Draws a cyan line from (395, 119) to (447, 42).
; PLAN: r0=395(x1), r1=119(y1), r2=447(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 119
LDI r2, 447
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
