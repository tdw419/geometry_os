; DESCRIPTION: Composite: Sets a single yellow pixel at (265, 171) then Draws a red line from (167, 196) to (322, 215) then Places a red 98x62 rectangle at position (34, 120).
; PLAN: r0=265(x), r1=171(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=167(x1), r6=196(y1), r7=322(x2), r8=215(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=34(x), r11=120(y), r12=98(width), r13=62(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 171
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 167
LDI r6, 196
LDI r7, 322
LDI r8, 215
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 120
LDI r12, 98
LDI r13, 62
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
