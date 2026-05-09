; DESCRIPTION: Renders a cyan line between points (479, 40) and (10, 87).
; PLAN: r0=479(x1), r1=40(y1), r2=10(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 40
LDI r2, 10
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
