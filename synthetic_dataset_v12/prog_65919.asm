; DESCRIPTION: Places a orange 27x117 rectangle at position (20, 118).
; PLAN: r0=20(x), r1=118(y), r2=27(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 118
LDI r2, 27
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
