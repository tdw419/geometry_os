; DESCRIPTION: Composite: Places a orange 63x61 rectangle at position (385, 92) then Places a magenta dot at position (336, 57).
; PLAN: r0=385(x), r1=92(y), r2=63(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x), r6=57(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 385
LDI r1, 92
LDI r2, 63
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 57
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
