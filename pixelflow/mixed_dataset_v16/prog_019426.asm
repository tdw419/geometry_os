; DESCRIPTION: Places a blue 87x116 rectangle at position (243, 49).
; PLAN: r0=243(x), r1=49(y), r2=87(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 49
LDI r2, 87
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
