; DESCRIPTION: Renders a red rectangular region spanning 61 by 16 at (241, 127).
; PLAN: r0=241(x), r1=127(y), r2=61(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 127
LDI r2, 61
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
