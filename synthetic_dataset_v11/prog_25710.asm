; DESCRIPTION: Places a red 14x36 rectangle at position (108, 65).
; PLAN: r0=108(x), r1=65(y), r2=14(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 65
LDI r2, 14
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
