; DESCRIPTION: Draws a cyan line from (45, 120) to (181, 171).
; PLAN: r0=45(x1), r1=120(y1), r2=181(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 120
LDI r2, 181
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
