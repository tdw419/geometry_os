; DESCRIPTION: Composite: Places a blue 15x27 rectangle at position (335, 32) then Places a orange line segment connecting (447, 65) to (281, 59).
; PLAN: r0=335(x), r1=32(y), r2=15(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x1), r6=65(y1), r7=281(x2), r8=59(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 32
LDI r2, 15
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 65
LDI r7, 281
LDI r8, 59
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
