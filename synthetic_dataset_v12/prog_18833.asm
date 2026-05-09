; DESCRIPTION: Composite: Draws a magenta circle centered at (50, 56) with radius 13 then Creates a cyan rectangular region at (173, 229) spanning 91 by 19 pixels.
; PLAN: r0=50(x), r1=56(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=229(y), r7=91(width), r8=19(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 56
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 229
LDI r7, 91
LDI r8, 19
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
