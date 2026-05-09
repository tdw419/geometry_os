; DESCRIPTION: Renders a cyan line between points (361, 214) and (50, 14).
; PLAN: r0=361(x1), r1=214(y1), r2=50(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 214
LDI r2, 50
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
