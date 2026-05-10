; DESCRIPTION: Renders a white line between points (487, 151) and (82, 255).
; PLAN: r0=487(x1), r1=151(y1), r2=82(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 151
LDI r2, 82
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
