; DESCRIPTION: Renders a cyan line between points (161, 45) and (289, 146).
; PLAN: r0=161(x1), r1=45(y1), r2=289(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 45
LDI r2, 289
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
