; DESCRIPTION: Composite: Places a green dot at position (320, 82) then Renders a black line between points (65, 181) and (209, 16) then Places a cyan 111x29 rectangle at position (79, 143).
; PLAN: r0=320(x), r1=82(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=65(x1), r6=181(y1), r7=209(x2), r8=16(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=79(x), r11=143(y), r12=111(width), r13=29(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 82
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 65
LDI r6, 181
LDI r7, 209
LDI r8, 16
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 143
LDI r12, 111
LDI r13, 29
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
