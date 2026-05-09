; DESCRIPTION: Renders a red line between points (173, 187) and (406, 228).
; PLAN: r0=173(x1), r1=187(y1), r2=406(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 187
LDI r2, 406
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
