; DESCRIPTION: Draws a cyan line from (120, 4) to (215, 238).
; PLAN: r0=120(x1), r1=4(y1), r2=215(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 4
LDI r2, 215
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
