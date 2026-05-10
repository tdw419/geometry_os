; DESCRIPTION: Composite: Creates a red rectangular region at (297, 5) spanning 50 by 37 pixels then Places a magenta dot at position (70, 32).
; PLAN: r0=297(x), r1=5(y), r2=50(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x), r6=32(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 297
LDI r1, 5
LDI r2, 50
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 32
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
