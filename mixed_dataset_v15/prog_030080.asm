; DESCRIPTION: Places a red 16x43 rectangle at position (307, 140).
; PLAN: r0=307(x), r1=140(y), r2=16(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 140
LDI r2, 16
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
