; DESCRIPTION: Composite: Places a cyan 99x112 rectangle at position (328, 129) then Draws a red circle centered at (78, 116) with radius 77.
; PLAN: r0=328(x), r1=129(y), r2=99(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x), r6=116(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 129
LDI r2, 99
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 116
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
