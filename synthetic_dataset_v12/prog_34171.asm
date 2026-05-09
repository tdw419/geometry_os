; DESCRIPTION: Composite: Places a cyan circle of radius 63 at center (327, 131) then Renders a orange line between points (210, 34) and (8, 171).
; PLAN: r0=327(x), r1=131(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x1), r6=34(y1), r7=8(x2), r8=171(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 131
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 34
LDI r7, 8
LDI r8, 171
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
