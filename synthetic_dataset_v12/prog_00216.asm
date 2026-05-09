; DESCRIPTION: Places a red 38x36 rectangle at position (263, 5).
; PLAN: r0=263(x), r1=5(y), r2=38(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 5
LDI r2, 38
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
