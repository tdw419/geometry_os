; DESCRIPTION: Composite: Creates a blue rectangular region at (229, 64) spanning 68 by 117 pixels then Places a cyan dot at position (425, 91).
; PLAN: r0=229(x), r1=64(y), r2=68(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x), r6=91(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 64
LDI r2, 68
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 91
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
