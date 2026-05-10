; DESCRIPTION: Places a magenta 27x39 box at position (87, 36).
; PLAN: r0=87(x), r1=36(y), r2=27(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 36
LDI r2, 27
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
