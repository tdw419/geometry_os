; DESCRIPTION: Composite: Places a cyan 36x23 rectangle at position (294, 152) then Creates a cyan circular shape at (261, 70) with radius 28.
; PLAN: r0=294(x), r1=152(y), r2=36(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=70(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 294
LDI r1, 152
LDI r2, 36
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 70
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
