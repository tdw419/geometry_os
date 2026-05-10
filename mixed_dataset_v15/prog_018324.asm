; DESCRIPTION: Composite: Places a magenta 113x90 rectangle at position (187, 58) then Renders a white line between points (417, 183) and (375, 138).
; PLAN: r0=187(x), r1=58(y), r2=113(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=417(x1), r6=183(y1), r7=375(x2), r8=138(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 187
LDI r1, 58
LDI r2, 113
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 183
LDI r7, 375
LDI r8, 138
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
