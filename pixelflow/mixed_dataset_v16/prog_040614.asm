; DESCRIPTION: Composite: Renders a magenta line between points (398, 64) and (414, 189) then Places a green 50x19 rectangle at position (115, 94).
; PLAN: r0=398(x1), r1=64(y1), r2=414(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=94(y), r7=50(width), r8=19(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 64
LDI r2, 414
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 94
LDI r7, 50
LDI r8, 19
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
