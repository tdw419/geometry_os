; DESCRIPTION: Renders a cyan line between points (305, 142) and (410, 140).
; PLAN: r0=305(x1), r1=142(y1), r2=410(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 142
LDI r2, 410
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
