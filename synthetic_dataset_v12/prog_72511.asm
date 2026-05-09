; DESCRIPTION: Places a red 13x111 rectangle at position (291, 54).
; PLAN: r0=291(x), r1=54(y), r2=13(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 54
LDI r2, 13
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
