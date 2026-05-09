; DESCRIPTION: Places a magenta 88x41 rectangle at position (280, 213).
; PLAN: r0=280(x), r1=213(y), r2=88(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 213
LDI r2, 88
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
