; DESCRIPTION: Composite: Places a black 56x96 rectangle at position (103, 70) then Places a orange circle of radius 14 at center (448, 213).
; PLAN: r0=103(x), r1=70(y), r2=56(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=448(x), r6=213(y), r7=14(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 103
LDI r1, 70
LDI r2, 56
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 213
LDI r7, 14
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
