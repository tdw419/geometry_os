; DESCRIPTION: Composite: Places a yellow 50x50 rectangle at position (283, 134) then Places a yellow line segment connecting (239, 57) to (111, 171).
; PLAN: r0=283(x), r1=134(y), r2=50(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x1), r6=57(y1), r7=111(x2), r8=171(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 134
LDI r2, 50
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 57
LDI r7, 111
LDI r8, 171
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
