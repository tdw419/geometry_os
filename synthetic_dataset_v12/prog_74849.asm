; DESCRIPTION: Composite: Renders a yellow line between points (352, 129) and (424, 171) then Places a orange 114x78 rectangle at position (239, 51).
; PLAN: r0=352(x1), r1=129(y1), r2=424(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=51(y), r7=114(width), r8=78(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 129
LDI r2, 424
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 51
LDI r7, 114
LDI r8, 78
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
