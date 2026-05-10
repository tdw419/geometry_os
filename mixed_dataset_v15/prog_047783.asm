; DESCRIPTION: Composite: Draws a orange rectangle at (146, 13) with width 72 and height 42 then Places a purple dot at position (38, 189).
; PLAN: r0=146(x), r1=13(y), r2=72(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x), r6=189(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 146
LDI r1, 13
LDI r2, 72
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 189
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
