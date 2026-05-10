; DESCRIPTION: Composite: Places a yellow dot at position (511, 193) then Places a cyan 27x113 rectangle at position (194, 93) then Draws a magenta line from (471, 76) to (6, 47).
; PLAN: r0=511(x), r1=193(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=93(y), r7=27(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=471(x1), r11=76(y1), r12=6(x2), r13=47(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 511
LDI r1, 193
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 194
LDI r6, 93
LDI r7, 27
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 76
LDI r12, 6
LDI r13, 47
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
