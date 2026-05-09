; DESCRIPTION: Places a magenta 27x27 rectangle at position (213, 131).
; PLAN: r0=213(x), r1=131(y), r2=27(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 131
LDI r2, 27
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
