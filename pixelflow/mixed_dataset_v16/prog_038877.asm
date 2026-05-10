; DESCRIPTION: Composite: Places a red 21x90 rectangle at position (14, 17) then Places a green dot at position (434, 136).
; PLAN: r0=14(x), r1=17(y), r2=21(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=136(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 14
LDI r1, 17
LDI r2, 21
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 136
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
