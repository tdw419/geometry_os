; DESCRIPTION: Places a red 33x30 rectangle at position (183, 95).
; PLAN: r0=183(x), r1=95(y), r2=33(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 95
LDI r2, 33
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
