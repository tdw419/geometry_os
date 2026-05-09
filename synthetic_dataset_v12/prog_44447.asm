; DESCRIPTION: Places a orange 38x71 rectangle at position (362, 71).
; PLAN: r0=362(x), r1=71(y), r2=38(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 71
LDI r2, 38
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
