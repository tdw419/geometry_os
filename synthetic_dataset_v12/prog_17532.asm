; DESCRIPTION: Composite: Places a cyan 63x56 rectangle at position (22, 26) then Renders a orange disk with center (252, 146) and radius 25.
; PLAN: r0=22(x), r1=26(y), r2=63(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x), r6=146(y), r7=25(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 22
LDI r1, 26
LDI r2, 63
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 146
LDI r7, 25
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
