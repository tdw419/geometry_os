; DESCRIPTION: Composite: Places a white 86x45 rectangle at position (164, 49) then Renders a green disk with center (438, 209) and radius 44.
; PLAN: r0=164(x), r1=49(y), r2=86(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x), r6=209(y), r7=44(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 164
LDI r1, 49
LDI r2, 86
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 209
LDI r7, 44
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
