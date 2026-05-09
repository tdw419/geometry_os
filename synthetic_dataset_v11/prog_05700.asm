; DESCRIPTION: Renders a cyan line between points (99, 167) and (228, 83).
; PLAN: r0=99(x1), r1=167(y1), r2=228(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 167
LDI r2, 228
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
