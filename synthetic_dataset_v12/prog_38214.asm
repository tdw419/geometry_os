; DESCRIPTION: Composite: Renders a cyan box of size 82x93 starting at (391, 155) then Renders a black line between points (20, 39) and (418, 186).
; PLAN: r0=391(x), r1=155(y), r2=82(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x1), r6=39(y1), r7=418(x2), r8=186(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 155
LDI r2, 82
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 39
LDI r7, 418
LDI r8, 186
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
