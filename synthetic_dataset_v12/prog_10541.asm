; DESCRIPTION: Places a magenta 27x92 rectangle at position (315, 28).
; PLAN: r0=315(x), r1=28(y), r2=27(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 28
LDI r2, 27
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
