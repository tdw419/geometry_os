; DESCRIPTION: Places a magenta 27x31 rectangle at position (367, 37).
; PLAN: r0=367(x), r1=37(y), r2=27(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 37
LDI r2, 27
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
