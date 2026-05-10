; DESCRIPTION: Composite: Places a cyan 23x112 rectangle at position (307, 16) then Draws a red circle centered at (342, 170) with radius 60.
; PLAN: r0=307(x), r1=16(y), r2=23(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=170(y), r7=60(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 307
LDI r1, 16
LDI r2, 23
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 170
LDI r7, 60
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
