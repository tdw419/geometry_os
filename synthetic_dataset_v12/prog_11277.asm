; DESCRIPTION: Composite: Places a white 38x25 rectangle at position (465, 50) then Renders a purple disk with center (79, 75) and radius 74.
; PLAN: r0=465(x), r1=50(y), r2=38(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=75(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 465
LDI r1, 50
LDI r2, 38
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 75
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
