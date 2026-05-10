; DESCRIPTION: Composite: Renders a red box of size 102x46 starting at (406, 13) then Draws a red line from (439, 177) to (508, 160).
; PLAN: r0=406(x), r1=13(y), r2=102(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x1), r6=177(y1), r7=508(x2), r8=160(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 13
LDI r2, 102
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 177
LDI r7, 508
LDI r8, 160
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
