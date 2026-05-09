; DESCRIPTION: Composite: Draws a cyan line from (259, 34) to (341, 249) then Draws a yellow rectangle at (92, 120) with width 31 and height 12.
; PLAN: r0=259(x1), r1=34(y1), r2=341(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=120(y), r7=31(width), r8=12(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 34
LDI r2, 341
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 120
LDI r7, 31
LDI r8, 12
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
