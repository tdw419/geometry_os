; DESCRIPTION: Draws a cyan rectangle at (267, 107) with width 82 and height 64.
; PLAN: r0=267(x), r1=107(y), r2=82(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 107
LDI r2, 82
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
