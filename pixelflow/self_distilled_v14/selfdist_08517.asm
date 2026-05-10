; DESCRIPTION: Places a red 62x28 box at position (307, 56).
; PLAN: r0=307(x), r1=56(y), r2=62(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 56
LDI r2, 62
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
