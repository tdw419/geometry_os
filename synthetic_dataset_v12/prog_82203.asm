; DESCRIPTION: Composite: Creates a red circular shape at (286, 75) with radius 53 then Renders a cyan line between points (408, 255) and (456, 139).
; PLAN: r0=286(x), r1=75(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=408(x1), r6=255(y1), r7=456(x2), r8=139(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 75
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 408
LDI r6, 255
LDI r7, 456
LDI r8, 139
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
