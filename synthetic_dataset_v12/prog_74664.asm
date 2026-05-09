; DESCRIPTION: Places a orange 12x90 rectangle at position (488, 156).
; PLAN: r0=488(x), r1=156(y), r2=12(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 156
LDI r2, 12
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
