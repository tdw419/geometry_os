; DESCRIPTION: Composite: Renders a magenta line between points (504, 82) and (423, 5) then Places a cyan 50x39 rectangle at position (195, 173) then Places a purple dot at position (63, 174).
; PLAN: r0=504(x1), r1=82(y1), r2=423(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=195(x), r6=173(y), r7=50(width), r8=39(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=63(x), r11=174(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 504
LDI r1, 82
LDI r2, 423
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 173
LDI r7, 50
LDI r8, 39
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 174
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
