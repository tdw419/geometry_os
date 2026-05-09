; DESCRIPTION: Composite: Creates a magenta circular shape at (306, 161) with radius 61 then Places a magenta 31x90 rectangle at position (0, 42).
; PLAN: r0=306(x), r1=161(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x), r6=42(y), r7=31(width), r8=90(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 161
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 42
LDI r7, 31
LDI r8, 90
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
