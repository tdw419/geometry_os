; DESCRIPTION: Composite: Places a black 28x37 rectangle at position (202, 57) then Renders a cyan line between points (28, 9) and (184, 147).
; PLAN: r0=202(x), r1=57(y), r2=28(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=28(x1), r6=9(y1), r7=184(x2), r8=147(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 57
LDI r2, 28
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 9
LDI r7, 184
LDI r8, 147
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
