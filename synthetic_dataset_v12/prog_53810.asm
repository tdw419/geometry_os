; DESCRIPTION: Renders a cyan line between points (479, 60) and (372, 133).
; PLAN: r0=479(x1), r1=60(y1), r2=372(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 60
LDI r2, 372
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
