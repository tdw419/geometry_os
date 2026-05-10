; DESCRIPTION: Composite: Draws a yellow line from (48, 68) to (32, 56) then Places a cyan 15x112 rectangle at position (194, 28).
; PLAN: r0=48(x1), r1=68(y1), r2=32(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=28(y), r7=15(width), r8=112(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 68
LDI r2, 32
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 28
LDI r7, 15
LDI r8, 112
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
