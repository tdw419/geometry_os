; DESCRIPTION: Composite: Sets a single cyan pixel at (154, 238) then Draws a white rectangle at (204, 141) with width 117 and height 24.
; PLAN: r0=154(x), r1=238(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=204(x), r6=141(y), r7=117(width), r8=24(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 238
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 204
LDI r6, 141
LDI r7, 117
LDI r8, 24
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
