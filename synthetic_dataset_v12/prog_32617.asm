; DESCRIPTION: Renders a green line between points (159, 221) and (419, 228).
; PLAN: r0=159(x1), r1=221(y1), r2=419(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 221
LDI r2, 419
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
