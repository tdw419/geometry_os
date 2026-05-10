; DESCRIPTION: Composite: Creates a red rectangular region at (260, 150) spanning 120 by 63 pixels then Places a purple dot at position (103, 89).
; PLAN: r0=260(x), r1=150(y), r2=120(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x), r6=89(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 260
LDI r1, 150
LDI r2, 120
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 89
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
