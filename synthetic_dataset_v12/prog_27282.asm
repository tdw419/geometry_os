; DESCRIPTION: Places a red 106x15 rectangle at position (17, 50).
; PLAN: r0=17(x), r1=50(y), r2=106(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 50
LDI r2, 106
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
