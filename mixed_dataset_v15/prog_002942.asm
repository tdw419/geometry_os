; DESCRIPTION: Composite: Places a red circle of radius 76 at center (143, 134) then Places a yellow 15x76 rectangle at position (103, 54).
; PLAN: r0=143(x), r1=134(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=103(x), r6=54(y), r7=15(width), r8=76(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 134
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 103
LDI r6, 54
LDI r7, 15
LDI r8, 76
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
