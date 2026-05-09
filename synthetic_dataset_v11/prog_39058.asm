; DESCRIPTION: Renders a cyan line between points (233, 215) and (214, 238).
; PLAN: r0=233(x1), r1=215(y1), r2=214(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 215
LDI r2, 214
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
