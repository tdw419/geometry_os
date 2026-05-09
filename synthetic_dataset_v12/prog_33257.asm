; DESCRIPTION: Renders a blue line between points (213, 27) and (320, 47).
; PLAN: r0=213(x1), r1=27(y1), r2=320(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 27
LDI r2, 320
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
