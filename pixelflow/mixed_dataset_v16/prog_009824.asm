; DESCRIPTION: Composite: Sets a single black pixel at (213, 196) then Renders a green line between points (176, 177) and (461, 190) then Places a white 59x113 rectangle at position (371, 113).
; PLAN: r0=213(x), r1=196(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=176(x1), r6=177(y1), r7=461(x2), r8=190(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=371(x), r11=113(y), r12=59(width), r13=113(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 196
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 176
LDI r6, 177
LDI r7, 461
LDI r8, 190
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 113
LDI r12, 59
LDI r13, 113
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
