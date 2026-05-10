; DESCRIPTION: Places a blue 108x27 rectangle at position (242, 165).
; PLAN: r0=242(x), r1=165(y), r2=108(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 165
LDI r2, 108
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
