; DESCRIPTION: Renders a cyan line between points (25, 26) and (209, 195).
; PLAN: r0=25(x1), r1=26(y1), r2=209(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 26
LDI r2, 209
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
