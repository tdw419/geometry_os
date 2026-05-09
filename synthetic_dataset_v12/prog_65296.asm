; DESCRIPTION: Composite: Creates a yellow rectangular region at (141, 152) spanning 42 by 59 pixels then Places a magenta dot at position (58, 233).
; PLAN: r0=141(x), r1=152(y), r2=42(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x), r6=233(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 141
LDI r1, 152
LDI r2, 42
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 233
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
