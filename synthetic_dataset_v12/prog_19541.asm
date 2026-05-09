; DESCRIPTION: Places a magenta 71x36 rectangle at position (174, 27).
; PLAN: r0=174(x), r1=27(y), r2=71(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 27
LDI r2, 71
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
