; DESCRIPTION: Composite: Renders a black line between points (86, 179) and (128, 121) then Places a yellow 73x26 rectangle at position (374, 8).
; PLAN: r0=86(x1), r1=179(y1), r2=128(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=8(y), r7=73(width), r8=26(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 179
LDI r2, 128
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 8
LDI r7, 73
LDI r8, 26
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
