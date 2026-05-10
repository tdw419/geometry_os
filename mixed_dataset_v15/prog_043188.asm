; DESCRIPTION: Composite: Creates a magenta rectangular region at (440, 126) spanning 21 by 50 pixels then Places a orange dot at position (398, 160).
; PLAN: r0=440(x), r1=126(y), r2=21(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=398(x), r6=160(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 440
LDI r1, 126
LDI r2, 21
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 160
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
