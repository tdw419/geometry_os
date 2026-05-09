; DESCRIPTION: Places a blue 77x108 rectangle at position (242, 44).
; PLAN: r0=242(x), r1=44(y), r2=77(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 44
LDI r2, 77
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
