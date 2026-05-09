; DESCRIPTION: Renders a cyan line between points (494, 47) and (313, 177).
; PLAN: r0=494(x1), r1=47(y1), r2=313(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 47
LDI r2, 313
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
