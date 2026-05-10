; DESCRIPTION: Renders a cyan line between points (104, 167) and (209, 172).
; PLAN: r0=104(x1), r1=167(y1), r2=209(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 167
LDI r2, 209
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
