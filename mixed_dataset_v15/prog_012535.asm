; DESCRIPTION: Composite: Places a cyan dot at position (95, 80) then Places a red line segment connecting (14, 240) to (346, 227).
; PLAN: r0=95(x), r1=80(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=14(x1), r6=240(y1), r7=346(x2), r8=227(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 80
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 14
LDI r6, 240
LDI r7, 346
LDI r8, 227
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
