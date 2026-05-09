; DESCRIPTION: Places a orange 48x49 rectangle at position (121, 126).
; PLAN: r0=121(x), r1=126(y), r2=48(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 126
LDI r2, 48
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
