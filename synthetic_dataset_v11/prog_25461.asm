; DESCRIPTION: Renders a cyan line between points (215, 28) and (35, 94).
; PLAN: r0=215(x1), r1=28(y1), r2=35(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 28
LDI r2, 35
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
