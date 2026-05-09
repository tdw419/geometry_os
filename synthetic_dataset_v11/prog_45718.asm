; DESCRIPTION: Places a magenta 72x91 rectangle at position (4, 27).
; PLAN: r0=4(x), r1=27(y), r2=72(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 27
LDI r2, 72
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
