; DESCRIPTION: Renders a cyan line between points (223, 210) and (214, 243).
; PLAN: r0=223(x1), r1=210(y1), r2=214(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 210
LDI r2, 214
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
