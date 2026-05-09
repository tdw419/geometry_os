; DESCRIPTION: Composite: Creates a red rectangular region at (431, 189) spanning 21 by 53 pixels then Places a orange dot at position (224, 161).
; PLAN: r0=431(x), r1=189(y), r2=21(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x), r6=161(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 431
LDI r1, 189
LDI r2, 21
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 161
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
