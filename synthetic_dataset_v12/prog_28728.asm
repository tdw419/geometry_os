; DESCRIPTION: Composite: Sets a single green pixel at (392, 28) then Renders a red line between points (295, 141) and (456, 127).
; PLAN: r0=392(x), r1=28(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=295(x1), r6=141(y1), r7=456(x2), r8=127(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 28
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 295
LDI r6, 141
LDI r7, 456
LDI r8, 127
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
