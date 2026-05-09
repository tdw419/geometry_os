; DESCRIPTION: Composite: Renders a cyan line between points (146, 71) and (362, 27) then Draws a red rectangle at (48, 21) with width 54 and height 110.
; PLAN: r0=146(x1), r1=71(y1), r2=362(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=48(x), r6=21(y), r7=54(width), r8=110(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 71
LDI r2, 362
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 21
LDI r7, 54
LDI r8, 110
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
