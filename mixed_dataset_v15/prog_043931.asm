; DESCRIPTION: Renders a cyan line between points (216, 167) and (58, 215).
; PLAN: r0=216(x1), r1=167(y1), r2=58(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 167
LDI r2, 58
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
