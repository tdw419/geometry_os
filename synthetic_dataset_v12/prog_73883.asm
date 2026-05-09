; DESCRIPTION: Composite: Places a magenta dot at position (220, 247) then Draws a magenta rectangle at (102, 82) with width 42 and height 46 then Places a white circle of radius 70 at center (226, 125).
; PLAN: r0=220(x), r1=247(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=82(y), r7=42(width), r8=46(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=226(x), r11=125(y), r12=70(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 247
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 102
LDI r6, 82
LDI r7, 42
LDI r8, 46
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 125
LDI r12, 70
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
