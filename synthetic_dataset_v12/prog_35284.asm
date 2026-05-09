; DESCRIPTION: Renders a green line between points (103, 29) and (450, 113).
; PLAN: r0=103(x1), r1=29(y1), r2=450(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 29
LDI r2, 450
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
