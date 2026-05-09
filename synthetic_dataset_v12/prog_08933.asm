; DESCRIPTION: Composite: Places a green dot at position (123, 26) then Renders a red line between points (157, 43) and (383, 239).
; PLAN: r0=123(x), r1=26(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=157(x1), r6=43(y1), r7=383(x2), r8=239(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 26
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 157
LDI r6, 43
LDI r7, 383
LDI r8, 239
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
