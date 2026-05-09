; DESCRIPTION: Composite: Draws a magenta rectangle at (230, 168) with width 31 and height 83 then Draws a green line from (77, 37) to (63, 27).
; PLAN: r0=230(x), r1=168(y), r2=31(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x1), r6=37(y1), r7=63(x2), r8=27(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 168
LDI r2, 31
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 37
LDI r7, 63
LDI r8, 27
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
