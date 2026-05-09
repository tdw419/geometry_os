; DESCRIPTION: Composite: Places a green dot at position (382, 250) then Draws a white rectangle at (186, 50) with width 16 and height 24.
; PLAN: r0=382(x), r1=250(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=50(y), r7=16(width), r8=24(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 250
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 186
LDI r6, 50
LDI r7, 16
LDI r8, 24
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
