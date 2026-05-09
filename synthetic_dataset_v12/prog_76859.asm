; DESCRIPTION: Composite: Renders a blue line between points (425, 28) and (501, 38) then Places a magenta dot at position (500, 33).
; PLAN: r0=425(x1), r1=28(y1), r2=501(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=500(x), r6=33(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 425
LDI r1, 28
LDI r2, 501
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 500
LDI r6, 33
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
