; DESCRIPTION: Places a red 39x32 rectangle at position (263, 100).
; PLAN: r0=263(x), r1=100(y), r2=39(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 100
LDI r2, 39
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
