; DESCRIPTION: Composite: Renders a purple box of size 42x27 starting at (465, 206) then Places a red dot at position (214, 147).
; PLAN: r0=465(x), r1=206(y), r2=42(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x), r6=147(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 465
LDI r1, 206
LDI r2, 42
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 147
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
