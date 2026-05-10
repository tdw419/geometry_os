; DESCRIPTION: Composite: Renders a white box of size 47x20 starting at (16, 157) then Places a green dot at position (66, 245).
; PLAN: r0=16(x), r1=157(y), r2=47(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=245(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 16
LDI r1, 157
LDI r2, 47
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 245
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
