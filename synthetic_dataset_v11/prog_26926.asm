; DESCRIPTION: Places a blue 39x27 rectangle at position (68, 134).
; PLAN: r0=68(x), r1=134(y), r2=39(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 134
LDI r2, 39
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
