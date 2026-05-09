; DESCRIPTION: Places a red 50x38 rectangle at position (3, 126).
; PLAN: r0=3(x), r1=126(y), r2=50(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 126
LDI r2, 50
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
