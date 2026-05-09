; DESCRIPTION: Renders a cyan line between points (479, 88) and (299, 114).
; PLAN: r0=479(x1), r1=88(y1), r2=299(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 88
LDI r2, 299
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
