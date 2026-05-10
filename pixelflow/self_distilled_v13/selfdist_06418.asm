; DESCRIPTION: Draws a red rectangle at (392, 107) with width 31 and height 27.
; PLAN: r0=392(x), r1=107(y), r2=31(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 107
LDI r2, 31
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
