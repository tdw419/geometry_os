; DESCRIPTION: Composite: Sets a single white pixel at (395, 71) then Places a green 67x49 rectangle at position (246, 113).
; PLAN: r0=395(x), r1=71(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=246(x), r6=113(y), r7=67(width), r8=49(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 71
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 246
LDI r6, 113
LDI r7, 67
LDI r8, 49
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
