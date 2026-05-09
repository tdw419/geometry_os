; DESCRIPTION: Composite: Places a white dot at position (304, 135) then Draws a red rectangle at (180, 134) with width 71 and height 103.
; PLAN: r0=304(x), r1=135(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=134(y), r7=71(width), r8=103(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 135
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 180
LDI r6, 134
LDI r7, 71
LDI r8, 103
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
