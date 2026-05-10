; DESCRIPTION: Renders a white line between points (294, 240) and (135, 208).
; PLAN: r0=294(x1), r1=240(y1), r2=135(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 240
LDI r2, 135
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
