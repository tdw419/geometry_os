; DESCRIPTION: Composite: Places a white 111x35 rectangle at position (74, 128) then Renders a red line between points (34, 136) and (488, 37) then Places a black dot at position (262, 51).
; PLAN: r0=74(x), r1=128(y), r2=111(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=34(x1), r6=136(y1), r7=488(x2), r8=37(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=262(x), r11=51(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 74
LDI r1, 128
LDI r2, 111
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 136
LDI r7, 488
LDI r8, 37
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 51
LDI r12, 0x000000
PSET r10, r11, r12
HALT
