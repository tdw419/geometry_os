; DESCRIPTION: Composite: Places a red 10x42 rectangle at position (59, 100) then Renders a white line between points (374, 8) and (257, 141) then Places a yellow dot at position (288, 50).
; PLAN: r0=59(x), r1=100(y), r2=10(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x1), r6=8(y1), r7=257(x2), r8=141(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=288(x), r11=50(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 59
LDI r1, 100
LDI r2, 10
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 8
LDI r7, 257
LDI r8, 141
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 50
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
