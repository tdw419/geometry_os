; DESCRIPTION: Composite: Places a green 66x59 rectangle at position (242, 20) then Draws a black line from (359, 71) to (259, 192).
; PLAN: r0=242(x), r1=20(y), r2=66(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x1), r6=71(y1), r7=259(x2), r8=192(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 20
LDI r2, 66
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 71
LDI r7, 259
LDI r8, 192
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
