; DESCRIPTION: Places a blue 66x77 rectangle at position (264, 171).
; PLAN: r0=264(x), r1=171(y), r2=66(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 171
LDI r2, 66
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
