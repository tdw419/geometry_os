; DESCRIPTION: Places a magenta 101x34 rectangle at position (302, 27).
; PLAN: r0=302(x), r1=27(y), r2=101(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 27
LDI r2, 101
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
