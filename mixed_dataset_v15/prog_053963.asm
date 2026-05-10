; DESCRIPTION: Composite: Renders a magenta line between points (422, 9) and (121, 139) then Places a white 85x56 rectangle at position (353, 83).
; PLAN: r0=422(x1), r1=9(y1), r2=121(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=353(x), r6=83(y), r7=85(width), r8=56(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 9
LDI r2, 121
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 83
LDI r7, 85
LDI r8, 56
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
