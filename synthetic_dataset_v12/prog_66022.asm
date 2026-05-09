; DESCRIPTION: Places a blue 54x86 rectangle at position (354, 112).
; PLAN: r0=354(x), r1=112(y), r2=54(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 112
LDI r2, 54
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
