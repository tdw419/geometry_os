; DESCRIPTION: Composite: Places a orange circle of radius 16 at center (368, 42) then Places a green 96x52 rectangle at position (317, 149).
; PLAN: r0=368(x), r1=42(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x), r6=149(y), r7=96(width), r8=52(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 42
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 149
LDI r7, 96
LDI r8, 52
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
