; DESCRIPTION: Composite: Places a blue dot at position (415, 186) then Renders a red line between points (410, 215) and (189, 138).
; PLAN: r0=415(x), r1=186(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=410(x1), r6=215(y1), r7=189(x2), r8=138(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 186
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 410
LDI r6, 215
LDI r7, 189
LDI r8, 138
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
