; DESCRIPTION: Composite: Renders a green line between points (360, 38) and (196, 83) then Places a magenta dot at position (461, 223).
; PLAN: r0=360(x1), r1=38(y1), r2=196(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=461(x), r6=223(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 360
LDI r1, 38
LDI r2, 196
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 223
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
