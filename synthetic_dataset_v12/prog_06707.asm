; DESCRIPTION: Places a blue 21x77 rectangle at position (204, 6).
; PLAN: r0=204(x), r1=6(y), r2=21(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 6
LDI r2, 21
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
