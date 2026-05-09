; DESCRIPTION: Composite: Draws a cyan line from (403, 98) to (453, 108) then Draws a black rectangle at (260, 12) with width 116 and height 102 then Places a black dot at position (214, 213).
; PLAN: r0=403(x1), r1=98(y1), r2=453(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=12(y), r7=116(width), r8=102(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=214(x), r11=213(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 403
LDI r1, 98
LDI r2, 453
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 12
LDI r7, 116
LDI r8, 102
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 213
LDI r12, 0x000000
PSET r10, r11, r12
HALT
