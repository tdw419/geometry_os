; DESCRIPTION: Draws a yellow rectangle at (425, 107) with width 61 and height 72.
; PLAN: r0=425(x), r1=107(y), r2=61(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 107
LDI r2, 61
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
