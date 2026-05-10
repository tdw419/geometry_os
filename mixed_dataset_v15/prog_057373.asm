; DESCRIPTION: Composite: Places a cyan 119x63 rectangle at position (393, 14) then Draws a white circle centered at (308, 61) with radius 52.
; PLAN: r0=393(x), r1=14(y), r2=119(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x), r6=61(y), r7=52(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 393
LDI r1, 14
LDI r2, 119
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 61
LDI r7, 52
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
