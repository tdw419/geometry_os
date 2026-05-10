; DESCRIPTION: Places a red 81x65 rectangle at position (360, 27).
; PLAN: r0=360(x), r1=27(y), r2=81(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 27
LDI r2, 81
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
