; DESCRIPTION: Places a blue 98x25 rectangle at position (138, 143).
; PLAN: r0=138(x), r1=143(y), r2=98(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 143
LDI r2, 98
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
