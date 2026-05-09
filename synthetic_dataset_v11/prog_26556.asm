; DESCRIPTION: Places a red 50x109 rectangle at position (96, 126).
; PLAN: r0=96(x), r1=126(y), r2=50(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 126
LDI r2, 50
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
