; DESCRIPTION: Renders a cyan line between points (401, 169) and (111, 55).
; PLAN: r0=401(x1), r1=169(y1), r2=111(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 169
LDI r2, 111
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
