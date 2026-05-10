; DESCRIPTION: Composite: Draws a red circle centered at (446, 209) with radius 44 then Draws a cyan line from (458, 121) to (276, 166).
; PLAN: r0=446(x), r1=209(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=458(x1), r6=121(y1), r7=276(x2), r8=166(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 446
LDI r1, 209
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 458
LDI r6, 121
LDI r7, 276
LDI r8, 166
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
