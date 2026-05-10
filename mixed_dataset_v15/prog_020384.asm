; DESCRIPTION: Composite: Renders a yellow box of size 28x58 starting at (220, 42) then Sets a single black pixel at (133, 71).
; PLAN: r0=220(x), r1=42(y), r2=28(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x), r6=71(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 220
LDI r1, 42
LDI r2, 28
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 71
LDI r7, 0x000000
PSET r5, r6, r7
HALT
