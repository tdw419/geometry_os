; DESCRIPTION: Composite: Draws a yellow circle centered at (386, 164) with radius 70 then Renders a white line between points (372, 238) and (479, 72).
; PLAN: r0=386(x), r1=164(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x1), r6=238(y1), r7=479(x2), r8=72(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 164
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 238
LDI r7, 479
LDI r8, 72
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
