; DESCRIPTION: Renders a cyan line between points (429, 238) and (440, 230).
; PLAN: r0=429(x1), r1=238(y1), r2=440(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 238
LDI r2, 440
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
