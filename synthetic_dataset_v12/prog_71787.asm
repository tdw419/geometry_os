; DESCRIPTION: Composite: Creates a cyan rectangular region at (254, 123) spanning 16 by 47 pixels then Places a red circle of radius 42 at center (82, 204).
; PLAN: r0=254(x), r1=123(y), r2=16(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x), r6=204(y), r7=42(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 254
LDI r1, 123
LDI r2, 16
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 204
LDI r7, 42
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
