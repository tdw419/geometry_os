; DESCRIPTION: Composite: Draws a blue rectangle at (176, 213) with width 43 and height 39 then Renders a white line between points (504, 29) and (146, 119).
; PLAN: r0=176(x), r1=213(y), r2=43(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x1), r6=29(y1), r7=146(x2), r8=119(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 213
LDI r2, 43
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 29
LDI r7, 146
LDI r8, 119
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
