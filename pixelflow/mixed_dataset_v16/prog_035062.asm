; DESCRIPTION: Renders a white line between points (346, 23) and (218, 255).
; PLAN: r0=346(x1), r1=23(y1), r2=218(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 23
LDI r2, 218
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
