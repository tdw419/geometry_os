; DESCRIPTION: Renders a white box of size 108x79 starting at (362, 163).
; PLAN: r0=362(x), r1=163(y), r2=108(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 163
LDI r2, 108
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
