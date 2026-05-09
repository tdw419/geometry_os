; DESCRIPTION: Places a red 106x99 rectangle at position (326, 5).
; PLAN: r0=326(x), r1=5(y), r2=106(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 5
LDI r2, 106
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
