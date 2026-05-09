; DESCRIPTION: Composite: Renders a orange line between points (190, 166) and (494, 42) then Places a white 11x22 rectangle at position (50, 130).
; PLAN: r0=190(x1), r1=166(y1), r2=494(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=130(y), r7=11(width), r8=22(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 166
LDI r2, 494
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 130
LDI r7, 11
LDI r8, 22
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
