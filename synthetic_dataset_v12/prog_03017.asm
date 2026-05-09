; DESCRIPTION: Composite: Places a orange dot at position (224, 63) then Draws a yellow circle centered at (392, 42) with radius 35.
; PLAN: r0=224(x), r1=63(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=392(x), r6=42(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 224
LDI r1, 63
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 392
LDI r6, 42
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
