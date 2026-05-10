; DESCRIPTION: Composite: Creates a cyan rectangular region at (191, 173) spanning 75 by 80 pixels then Places a green dot at position (10, 81).
; PLAN: r0=191(x), r1=173(y), r2=75(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=10(x), r6=81(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 191
LDI r1, 173
LDI r2, 75
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 81
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
