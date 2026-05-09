; DESCRIPTION: Composite: Places a green dot at position (263, 88) then Draws a white rectangle at (61, 102) with width 91 and height 120.
; PLAN: r0=263(x), r1=88(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=61(x), r6=102(y), r7=91(width), r8=120(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 88
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 61
LDI r6, 102
LDI r7, 91
LDI r8, 120
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
