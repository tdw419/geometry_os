; DESCRIPTION: Composite: Places a blue 56x74 rectangle at position (259, 39) then Creates a cyan circular shape at (263, 231) with radius 18.
; PLAN: r0=259(x), r1=39(y), r2=56(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=231(y), r7=18(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 259
LDI r1, 39
LDI r2, 56
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 231
LDI r7, 18
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
