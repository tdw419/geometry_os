; DESCRIPTION: Draws a cyan line from (247, 214) to (120, 38).
; PLAN: r0=247(x1), r1=214(y1), r2=120(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 214
LDI r2, 120
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
