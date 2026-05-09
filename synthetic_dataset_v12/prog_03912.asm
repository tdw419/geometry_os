; DESCRIPTION: Composite: Sets a single white pixel at (214, 189) then Places a magenta 46x65 rectangle at position (179, 67).
; PLAN: r0=214(x), r1=189(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=179(x), r6=67(y), r7=46(width), r8=65(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 189
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 179
LDI r6, 67
LDI r7, 46
LDI r8, 65
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
