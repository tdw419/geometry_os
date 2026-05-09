; DESCRIPTION: Composite: Places a green dot at position (400, 19) then Draws a blue rectangle at (57, 86) with width 36 and height 95.
; PLAN: r0=400(x), r1=19(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=86(y), r7=36(width), r8=95(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 19
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 57
LDI r6, 86
LDI r7, 36
LDI r8, 95
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
