; DESCRIPTION: Composite: Renders a red line between points (249, 73) and (405, 211) then Renders a cyan disk with center (307, 133) and radius 65.
; PLAN: r0=249(x1), r1=73(y1), r2=405(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=133(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 249
LDI r1, 73
LDI r2, 405
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 133
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
