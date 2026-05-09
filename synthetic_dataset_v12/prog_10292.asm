; DESCRIPTION: Composite: Places a cyan 85x26 rectangle at position (132, 75) then Renders a magenta disk with center (195, 99) and radius 31.
; PLAN: r0=132(x), r1=75(y), r2=85(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x), r6=99(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 132
LDI r1, 75
LDI r2, 85
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 99
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
