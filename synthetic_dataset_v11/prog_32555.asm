; DESCRIPTION: Renders a green line between points (38, 173) and (74, 103).
; PLAN: r0=38(x1), r1=173(y1), r2=74(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 173
LDI r2, 74
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
