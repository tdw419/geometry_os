; DESCRIPTION: Composite: Renders a cyan line between points (208, 66) and (111, 47) then Places a white circle of radius 57 at center (398, 133).
; PLAN: r0=208(x1), r1=66(y1), r2=111(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=133(y), r7=57(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 208
LDI r1, 66
LDI r2, 111
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 133
LDI r7, 57
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
