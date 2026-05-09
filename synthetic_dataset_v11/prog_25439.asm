; DESCRIPTION: Renders a white line between points (92, 255) and (32, 29).
; PLAN: r0=92(x1), r1=255(y1), r2=32(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 255
LDI r2, 32
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
