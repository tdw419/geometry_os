; DESCRIPTION: Composite: Places a magenta dot at position (446, 103) then Draws a magenta rectangle at (173, 38) with width 82 and height 44.
; PLAN: r0=446(x), r1=103(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=173(x), r6=38(y), r7=82(width), r8=44(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 446
LDI r1, 103
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 173
LDI r6, 38
LDI r7, 82
LDI r8, 44
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
