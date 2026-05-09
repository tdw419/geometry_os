; DESCRIPTION: Composite: Places a red circle of radius 54 at center (179, 137) then Renders a purple box of size 66x42 starting at (87, 110).
; PLAN: r0=179(x), r1=137(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=110(y), r7=66(width), r8=42(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 137
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 110
LDI r7, 66
LDI r8, 42
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
