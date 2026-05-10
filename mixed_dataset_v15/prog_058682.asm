; DESCRIPTION: Composite: Places a white dot at position (70, 40) then Renders a red line between points (337, 221) and (17, 44).
; PLAN: r0=70(x), r1=40(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=337(x1), r6=221(y1), r7=17(x2), r8=44(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 40
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 337
LDI r6, 221
LDI r7, 17
LDI r8, 44
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
