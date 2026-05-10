; DESCRIPTION: Renders a green line between points (416, 228) and (293, 39).
; PLAN: r0=416(x1), r1=228(y1), r2=293(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 228
LDI r2, 293
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
