; DESCRIPTION: Composite: Places a orange line segment connecting (340, 221) to (192, 0) then Places a magenta dot at position (233, 218).
; PLAN: r0=340(x1), r1=221(y1), r2=192(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=218(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 340
LDI r1, 221
LDI r2, 192
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 218
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
