; DESCRIPTION: Composite: Renders a cyan line between points (129, 238) and (400, 116) then Places a black 60x116 rectangle at position (395, 84).
; PLAN: r0=129(x1), r1=238(y1), r2=400(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=84(y), r7=60(width), r8=116(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 238
LDI r2, 400
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 84
LDI r7, 60
LDI r8, 116
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
