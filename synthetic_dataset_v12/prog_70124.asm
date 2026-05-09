; DESCRIPTION: Renders a cyan line between points (189, 160) and (319, 113).
; PLAN: r0=189(x1), r1=160(y1), r2=319(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 160
LDI r2, 319
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
