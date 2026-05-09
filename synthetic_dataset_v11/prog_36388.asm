; DESCRIPTION: Places a blue 70x61 rectangle at position (46, 142).
; PLAN: r0=46(x), r1=142(y), r2=70(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 142
LDI r2, 70
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
